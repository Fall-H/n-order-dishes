package service

import (
	"context"
	"fmt"
	"github.com/gin-gonic/gin"
	uuid "github.com/satori/go.uuid"
	"org.nod/global"
	"org.nod/models"
	"strings"
)

func Login(c *gin.Context) {
	result := models.NewResult(c)

	var authorization = c.Request.Header.Get("Authorization")
	var token = ""
	token, err := global.App.Redis.Get(context.Background(), "nod:user:"+authorization).Result()

	if token != "" || err == nil {
		result.Success(gin.H{"token": authorization})
		return
	}

	var user *models.User
	if err := c.ShouldBind(&user); err != nil {
		panic(err)
		result.Error(400, "服务器错误")
		return
	}

	global.App.DB.Select("user_id, group_id").Table("t_user").Where("username = ? and password = ?",
		user.Username, user.Password).First(&user)

	if 0 == user.UserID {
		result.Error(400, "账号或密码错误")
		return
	}

	token = strings.ReplaceAll(uuid.NewV1().String(), "-", "")
	var value = fmt.Sprintf(`{"userId": %d, "groupId": %d}`, user.UserID, user.GroupID)
	global.App.Redis.Set(context.Background(), "nod:user:"+token, value, 86400000000000)

	result.Success(gin.H{"token": token})
	return
}
