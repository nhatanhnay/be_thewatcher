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

	routes.InitRoutes(router)

	routes.DataRoutes(router)

	router.Run(":" + CONFIG["port"])
}
