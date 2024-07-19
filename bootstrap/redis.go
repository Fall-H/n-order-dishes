package bootstrap

import (
	"context"
	"github.com/go-redis/redis/v8"
	"go.uber.org/zap"
	"org.nod/global"
)

func InitializeRedis() *redis.Client {
	redisConfig := global.App.Config.Redis

	client := redis.NewClient(&redis.Options{
		Addr:     redisConfig.Addr,
		Password: redisConfig.Password,
		DB:       redisConfig.DB,
	})

	_, err := client.Ping(context.Background()).Result()
	if err != nil {
		global.App.Log.Error("Redis connect ping failed, err:", zap.Any("err", err))
		return nil
	}

	return client
}
