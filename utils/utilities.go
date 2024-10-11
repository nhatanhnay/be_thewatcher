package utils

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func ReadAllSecrets() map[string]string {
	files, _ := os.ReadDir("config")

	SECRETS := make(map[string]string)

	for _, file := range files {
		if strings.HasSuffix(file.Name(), ".env") {
			SECRETS, _ = godotenv.Read("config/" + file.Name())
		}
	}

	return SECRETS
}

func ReadConfig() map[string]string {
	files, _ := os.ReadDir("config")

	CONFIG := make(map[string]string)

	for _, file := range files {
		if strings.HasSuffix(file.Name(), ".json") {
			file, err := os.Open("config/" + file.Name())

			if err != nil {
				panic(err)
			}

			byteValue, err := io.ReadAll(file)

			if err != nil {
				panic(err)
			}
			var result map[string]interface{}
			json.Unmarshal(byteValue, &result)

			for key, value := range result {
				CONFIG[key] = value.(string)
			}

			file.Close()
		}
	}

	return CONFIG
}

func Log(origin string, function string, section string, message string) {
	fmt.Println(origin + " | " + function + " | " + section + " | " + message)
}

func ConstructOutputMessage(responseCode int, message string) (int, gin.H) {
	return responseCode, gin.H{
		"message": message,
	}
}
