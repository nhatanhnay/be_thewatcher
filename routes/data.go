package routes

import (
	"backend/handlers"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func InitRoutes(router *gin.Engine) {
	router.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"POST", "PUT", "PATCH", "DELETE", "GET", "OPTIONS"},
		AllowHeaders:     []string{"Content-Type", "Authorization", "UserId", "RefreshToken", "Access-Control-Allow-Origin", "Access-Control-Allow-Headers"},
		AllowCredentials: true,
	}))
}

func DataRoutes(router *gin.Engine) {
	router.POST("/api/watch-details", handlers.GetWatchDetails)	
	router.POST("/api/insert-order", handlers.InsertOrderHandler)
	router.POST("/api/get-watch-by-category", handlers.GetWatchByCategory)
	router.POST("/api/get-watch-by-id", handlers.GetWatchDetailsById)
	router.POST("/api/get-watch-by-name", handlers.GetWatchBySearch)
}