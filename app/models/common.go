package models

import (
	"gorm.io/gorm"
	"time"
)

type Timestamps struct {
	CreatedTime time.Time `json:"created_time"`
	UpdatedTime time.Time `json:"update_time"`
}

type SoftDeletes struct {
	IsDelete gorm.DeletedAt `json:"is_delete"`
}

type User struct {
	UserID   uint   `json:"user_id" gorm:"primaryKey"`
	GroupID  uint   `json:"group_id" gorm:"index"`
	Username string `json:"username"`
	Password string `json:"password"`
	Timestamps
	SoftDeletes
}
