package dao

import (
	"org.nod/global"
	"org.nod/models"
)

func SelectAllDishesType(name string, groupId uint, limit int, offset int) models.Page {
	var count int64
	var dishesTypeList []*models.DishesType
	query := global.App.DB.Model(&models.Dishes{})
	query = query.Select("dishes_type_id, group_id, name").
		Table("t_dishes_type")

	if name != "" {
		query.Where("name = '%?%'", name)
	}

	if groupId != 0 {
		query.Where("group_id = ?", groupId)
	}

	err := query.Order("dishes_type_id asc").
		Limit(limit).
		Offset(offset).
		Scan(&dishesTypeList).
		Count(&count).Error

	if err != nil {
		return models.Page{}
	}

	interfaces := make([]interface{}, len(dishesTypeList))
	for i, dish := range dishesTypeList {
		interfaces[i] = dish
	}

	page := models.Page{
		List: interfaces,
		Size: count,
	}

	return page
}
