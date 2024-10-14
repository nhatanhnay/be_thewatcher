package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"backend/routes"
	"backend/connection"
	"backend/utils"
)

func main() {
	// Đọc cấu hình và secrets
	CONFIG := utils.ReadConfig()
	SECRETS := utils.ReadAllSecrets()

	// Khởi tạo kết nối cơ sở dữ liệu
	connection.InitDB(
		SECRETS["HOST"],
		SECRETS["PORT"],
		SECRETS["USER"],
		SECRETS["PASSWORD"],
		SECRETS["DBNAME"],
	)

	// Khởi tạo router với middleware CORS
	router := initRouter()

	// Khởi tạo các route
	routes.InitRoutes(router)
	routes.DataRoutes(router)

	// Chạy server
	if err := router.Run(":" + CONFIG["port"]); err != nil {
		log.Fatalf("Failed to run server: %v", err)
	}
}

// initRouter khởi tạo router và cấu hình middleware CORS
func initRouter() *gin.Engine {
	router := gin.Default()

	// Middleware CORS
	router.Use(func(c *gin.Context) {
		c.Header("Access-Control-Allow-Origin", "*") // Cho phép tất cả các domain
		c.Header("Access-Control-Allow-Headers", "Content-Type, Authorization") // Thêm Authorization nếu cần
		c.Header("Access-Control-Allow-Methods", "GET, POST, OPTIONS") // Các phương thức cho phép

		if c.Request.Method == http.MethodOptions {
			c.AbortWithStatus(http.StatusNoContent) // Trả về mã 204 cho các yêu cầu OPTIONS
			return
		}
		c.Next() // Tiếp tục xử lý yêu cầu
	})

	return router
}
