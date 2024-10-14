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
	// Read configuration and secrets
	CONFIG := utils.ReadConfig()
	SECRETS := utils.ReadAllSecrets()

	// Initialize database connection
	connection.InitDB(
		SECRETS["HOST"],
		SECRETS["PORT"],
		SECRETS["USER"],
		SECRETS["PASSWORD"],
		SECRETS["DBNAME"],
	)

	// Initialize router with CORS middleware
	router := initRouter()

	// Initialize routes
	routes.InitRoutes(router)
	routes.DataRoutes(router)

	// Run server
	if err := router.Run(":" + CONFIG["port"]); err != nil {
		log.Fatalf("Failed to run server: %v", err)
	}
}

// initRouter initializes the router and configures CORS middleware
func initRouter() *gin.Engine {
	router := gin.Default()

	// Middleware CORS
	router.Use(func(c *gin.Context) {
		origin := c.Request.Header.Get("Origin") // Get the request origin
		if origin == "http://103.81.87.196:4200" || origin == "http://localhost:4200" {
			c.Header("Access-Control-Allow-Origin", origin) // Allow the specific origin
		} else {
			c.Header("Access-Control-Allow-Origin", "http://103.81.87.196:4200") // Fallback to a default origin
		}
		c.Header("Access-Control-Allow-Headers", "Content-Type, Authorization")
		c.Header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")

		// Handle preflight requests
		if c.Request.Method == http.MethodOptions {
			c.AbortWithStatus(http.StatusNoContent) // Respond with 204 for OPTIONS requests
			return
		}
		c.Next() // Continue processing the request
	})

	return router
}
