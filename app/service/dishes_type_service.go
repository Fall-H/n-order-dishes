package service

import (
	"github.com/gin-gonic/gin"
	"org.nod/dao"
	"org.nod/models"
	"strconv"
)

func SelectAllDishesType(c *gin.Context) {
	result := models.NewResult(c)

	name := c.Query("name")
	groupId := c.GetUint("groupId")
	limit, _ := strconv.ParseUint(c.Query("limit"), 10, 64)
	offset, _ := strconv.ParseUint(c.Query("offset"), 10, 64)

	var dishesTypeList = dao.SelectAllDishesType(name,
		groupId, int(limit), int(offset))

	result.Success(dishesTypeList)
}
