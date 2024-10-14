package main

import (
	"github.com/gin-gonic/gin"
	"backend/routes"
	"backend/connection"
	"backend/utils"
)

func main() {
	CONFIG := utils.ReadConfig()
	SECRETS := utils.ReadAllSecrets()

	connection.InitDB(
		SECRETS["HOST"],
		SECRETS["PORT"],
		SECRETS["USER"],
		SECRETS["PASSWORD"],
		SECRETS["DBNAME"],
	)

	router := gin.Default()

	// Thêm middleware CORS
	router.Use(func(c *gin.Context) {
		c.Header("Access-Control-Allow-Origin", "*") // Cho phép tất cả các domain
		c.Header("Access-Control-Allow-Headers", "Content-Type")
		c.Header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(200) // Trả về mã 200 cho các yêu cầu OPTIONS
			return
		}
		c.Next() // Tiếp tục xử lý yêu cầu
	})

	// Khởi tạo các route
	routes.InitRoutes(router)
	routes.DataRoutes(router)

	router.Run(":" + CONFIG["port"])
}
