package routes

import (
	"backend/handlers"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func InitRoutes(router *gin.Engine) {
	router.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"http://localhost:4200"},
		AllowMethods:     []string{"POST", "PUT", "PATCH", "DELETE", "GET", "OPTIONS"},
		AllowHeaders:     []string{"Content-Type", "Authorization", "UserId", "RefreshToken", "Access-Control-Allow-Origin", "Access-Control-Allow-Headers"},
		AllowCredentials: true,
	}))
}

func DataRoutes(router *gin.Engine) {
	router.POST("/watch-details", handlers.GetWatchDetails)	
	router.POST("/insert-order", handlers.InsertOrderHandler)
}