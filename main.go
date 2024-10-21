package main

import (
	"log"
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
	router := gin.Default()

	// Initialize routes
	routes.InitRoutes(router)
	routes.DataRoutes(router)

	// Run server
	if err := router.Run(":" + CONFIG["port"]); err != nil {
		log.Fatalf("Failed to run server: %v", err)
	}
}
