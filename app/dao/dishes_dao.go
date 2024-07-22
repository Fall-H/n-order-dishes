package dao

import (
	"org.nod/global"
	"org.nod/models"
)

func SelectAllDishes(name string, groupId uint, dishesTypeId uint, limit int, offset int) models.Page {
	var count int64
	var dishesList []*models.Dishes
	query := global.App.DB.Model(&models.Dishes{})
	query = query.Select("dishes_id, dishes_type_id, group_id, name").
		Table("t_dishes")

	if name != "" {
		query.Where("name = '%?%'", name)
	}

	if groupId != 0 {
		query.Where("group_id = ?", groupId)
	}

	if dishesTypeId != 0 {
		query.Where("dishes_type_id = ?", dishesTypeId)
	}

	err := query.Order("dishes_id asc").
		Limit(limit).
		Offset(offset).
		Scan(&dishesList).
		Count(&count).Error

	if err != nil {
		return models.Page{}
	}

	interfaces := make([]interface{}, len(dishesList))
	for i, dish := range dishesList {
		interfaces[i] = dish
	}

	page := models.Page{
		List: interfaces,
		Size: count,
	}

	return page
}
