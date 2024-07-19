package main

import (
	"github.com/gin-gonic/gin"
	"org.nod/bootstrap"
	"org.nod/global"
	"org.nod/router"
)

func main() {
	bootstrap.InitializeConfig()

	global.App.Log = bootstrap.InitializeLog()
	global.App.Log.Info("log init success!")

	global.App.Redis = bootstrap.InitializeRedis()

	global.App.DB = bootstrap.InitializeDB()

	defer func() {
		if global.App.DB != nil {
			db, _ := global.App.DB.DB()
			db.Close()
		}
	}()

	r := gin.Default()

	router.LoadRoute(r)

	r.Run(":" + global.App.Config.App.Port)
}
