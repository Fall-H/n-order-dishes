package interceptor

import (
	"context"
	"encoding/json"
	"github.com/gin-gonic/gin"
	"org.nod/global"
	"org.nod/models"
)

func HttpInterceptor() gin.HandlerFunc {
	return func(c *gin.Context) {
		result := models.NewResult(c)
		var authorization = c.Request.Header.Get("Authorization")

		userDataStr, err := global.App.Redis.Get(context.Background(), "nod:user:"+authorization).Result()

		if authorization == "" || err != nil {
			result.Error("400", "token失效")
			c.Abort()
		} else {
			userDataMap := make(map[string]uint)
			err := json.Unmarshal([]byte(userDataStr), &userDataMap)

			if err != nil {
				result.Error("400", "用户信息不完整")
				c.Abort()
				return
			}

			c.Set("userId", userDataMap["userId"])
			c.Set("groupId", userDataMap["groupId"])
			c.Next()
		}
	}
}
