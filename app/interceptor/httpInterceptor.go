package interceptor

import (
	"context"
	"github.com/gin-gonic/gin"
	"org.nod/global"
	"org.nod/models"
)

func HttpInterceptor() gin.HandlerFunc {
	return func(c *gin.Context) {
		result := models.NewResult(c)
		var authorization = c.Request.Header.Get("Authorization")

		_, err := global.App.Redis.Get(context.Background(), authorization).Result()

		if authorization == "" || err != nil {
			result.Error(400, "token失效")
			c.Abort()
		} else {
			c.Next()
		}
	}
}
