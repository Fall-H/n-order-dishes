package main

import (
	"github.com/gin-gonic/gin"
	bootstrap2 "org.nod/bootstrap"
	"org.nod/global"
	"org.nod/router"
)

func main() {
	bootstrap2.InitializeConfig()

	global.App.Log = bootstrap2.InitializeLog()
	global.App.Log.Info("log init success!")

	global.App.Redis = bootstrap2.InitializeRedis()

	global.App.DB = bootstrap2.InitializeDB()

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
