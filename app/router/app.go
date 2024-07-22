package router

import (
	"github.com/gin-gonic/gin"
	"org.nod/interceptor"
	"org.nod/service"
)

func LoadRoute(engine *gin.Engine) {

	router := engine.Group("/nod")
	{
		router.POST("/login", service.Login)

		router.Use(interceptor.HttpInterceptor())

		router.GET("/dishes/all", service.SelectAllDishes)
		router.GET("/dishes/type/all", service.SelectAllDishesType)
	}
}
