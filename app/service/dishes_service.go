package service

import (
	"github.com/gin-gonic/gin"
	"org.nod/dao"
	"org.nod/models"
	"strconv"
)

func SelectAllDishes(c *gin.Context) {
	result := models.NewResult(c)

	name := c.Query("name")
	groupId := c.GetUint("groupId")
	dishesTypeID, _ := strconv.ParseUint(c.Query("dishesTypeId"), 10, 64)
	limit, _ := strconv.ParseUint(c.Query("limit"), 10, 64)
	offset, _ := strconv.ParseUint(c.Query("offset"), 10, 64)

	var dishesList = dao.SelectAllDishes(name,
		groupId, uint(dishesTypeID),
		int(limit), int(offset))

	result.Success(dishesList)
}
