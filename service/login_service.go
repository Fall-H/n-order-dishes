package service

import (
	"context"
	"github.com/gin-gonic/gin"
	uuid "github.com/satori/go.uuid"
	"org.nod/app/models"
	"org.nod/global"
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

	global.App.DB.Select("user_id").Table("t_user").Where("username = ? and password = ?",
		user.Username, user.Password).First(&user)

	if 0 == user.UserID {
		result.Error(400, "账号或密码错误")
		return
	}

	token = strings.ReplaceAll(uuid.NewV1().String(), "-", "")
	global.App.Redis.Set(context.Background(), "nod:user:"+token, strings(user.UserID), 60*60*24)

	result.Success(gin.H{"token": token})
	return
}
