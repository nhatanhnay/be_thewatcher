package handlers

import (
	"github.com/gin-gonic/gin"
	"log"
	"backend/connection"
	"net/http"
	"time"
)

type WatchDetail struct {
	Id 	 int     `json:"id"`
	Image     string  `json:"image"`
	Name         string  `json:"name"`
	Price        float64 `json:"price"`
	Rating       float64 `json:"rating"`
	Href     string  `json:"href"`
	NumberRating int     `json:"numberRating"`
	Description  string  `json:"description"`
	Category     string  `json:"category"`
}

type OrderInfo struct {
	Address   string `json:"address"`
	Email     string `json:"email"`
	Name      string `json:"name"`
	Phone     string `json:"phone"`
	OrderInfo []struct {
		ID       int    `json:"id"`
		Name     string `json:"name"`
		Price    float64 `json:"price"`
		UrlImage string `json:"urlImage"`
		Quantity int    `json:"quantity"`
	} `json:"order_info"`
}

func GetWatchDetails(c *gin.Context) {
	db := connection.GetDB()

	rows, err := db.Query("SELECT * FROM watch_details")
	if err != nil {
		log.Fatal(err)
	}

	var watchDetails []WatchDetail

	for rows.Next() {
		var watchDetail WatchDetail
		err := rows.Scan(&watchDetail.Id, &watchDetail.Image, &watchDetail.Name, &watchDetail.Price, &watchDetail.Rating, &watchDetail.Href, &watchDetail.NumberRating, &watchDetail.Description, &watchDetail.Category)
		if err != nil {
			log.Fatal(err)
		}
		watchDetails = append(watchDetails, watchDetail)
	}

	c.JSON(200, watchDetails)
}

func InsertOrderHandler(c *gin.Context) {
	// Check if the request method is POST
	if c.Request.Method != http.MethodPost {
		c.JSON(http.StatusMethodNotAllowed, gin.H{"error": "Invalid request method"})
		return
	}

	// Parse the incoming JSON request body
	var order OrderInfo
	if err := c.ShouldBindJSON(&order); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	// Get the current time for the order day
	orderDay := time.Now()

	// Get the database connection
	db := connection.GetDB()

	// Insert order info into `orders_info` table
	var lastInsertID int64
	err := db.QueryRow("INSERT INTO orders_info (order_day, address, email, name, phone) VALUES ($1, $2, $3, $4, $5) RETURNING id_order", orderDay, order.Address, order.Email, order.Name, order.Phone).Scan(&lastInsertID)
	if err != nil {
		log.Printf("Failed to insert order info: %v", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to insert order"})
		return
	}
	// Insert order details into `orders_details` table
	for _, orderDetail := range order.OrderInfo {
		_, err = db.Exec("INSERT INTO orders_watch (id_order, id_watch, quantity) VALUES ($1, $2, $3)", lastInsertID, orderDetail.ID, orderDetail.Quantity)
		if err != nil {
			log.Printf("Failed to insert order detail: %v", err)
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to insert order"})
			return
		}
	}


	// Respond with a success message and the inserted order ID
	c.JSON(http.StatusOK, gin.H{"message": "Order successfully inserted", "order_id": lastInsertID})
}

func GetWatchByCategory(c *gin.Context) {
    var requestBody struct {
        Category string `json:"category"`
    }

    // Parse JSON từ phần thân request
    if err := c.ShouldBindJSON(&requestBody); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request"})
        return
    }

    db := connection.GetDB()

    // Sử dụng LIKE để tìm kiếm chuỗi con
    rows, err := db.Query("SELECT * FROM watch_details WHERE category LIKE '%' || $1 || '%' ORDER BY id_watch", requestBody.Category)
    if err != nil {
        log.Fatal(err)
    }

    var watchDetails []WatchDetail

    for rows.Next() {
        var watchDetail WatchDetail
        err := rows.Scan(&watchDetail.Id, &watchDetail.Image, &watchDetail.Name, &watchDetail.Price, &watchDetail.Rating, &watchDetail.Href, &watchDetail.NumberRating, &watchDetail.Description, &watchDetail.Category)
        if err != nil {
            log.Fatal(err)
        }
        watchDetails = append(watchDetails, watchDetail)
    }

    c.JSON(200, watchDetails)
}

func GetWatchDetailsById(c *gin.Context) {
	var requestBody struct {
		ID int `json:"id"`
	}

	// Parse JSON từ phần thân request
	if err := c.ShouldBindJSON(&requestBody); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request"})
		return
	}

	db := connection.GetDB()

	// Sử dụng LIKE để tìm kiếm chuỗi con
	rows, err := db.Query("SELECT * FROM watch_details WHERE id_watch = $1", requestBody.ID)
	if err != nil {
		log.Fatal(err)
	}

	var watchDetails []WatchDetail

	for rows.Next() {
		var watchDetail WatchDetail
		err := rows.Scan(&watchDetail.Id, &watchDetail.Image, &watchDetail.Name, &watchDetail.Price, &watchDetail.Rating, &watchDetail.Href, &watchDetail.NumberRating, &watchDetail.Description, &watchDetail.Category)
		if err != nil {
			log.Fatal(err)
		}
		watchDetails = append(watchDetails, watchDetail)
	}

	c.JSON(200, watchDetails)
}

func GetWatchBySearch(c *gin.Context) {
	var requestBody struct {
		Name string `json:"name"`
	}

	// Parse JSON từ phần thân request
	if err := c.ShouldBindJSON(&requestBody); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request"})
		return
	}

	db := connection.GetDB()

	// Sử dụng LIKE để tìm kiếm chuỗi con trong coojt name vaf category
	rows, err := db.Query("SELECT * FROM watch_details WHERE name ILIKE '%' || $1 || '%' OR category ILIKE '%' || $1 || '%' ORDER BY id_watch", requestBody.Name)
	if err != nil {
		log.Fatal(err)
	}

	var watchDetails []WatchDetail

	for rows.Next() {
		var watchDetail WatchDetail
		err := rows.Scan(&watchDetail.Id, &watchDetail.Image, &watchDetail.Name, &watchDetail.Price, &watchDetail.Rating, &watchDetail.Href, &watchDetail.NumberRating, &watchDetail.Description, &watchDetail.Category)
		if err != nil {
			log.Fatal(err)
		}
		watchDetails = append(watchDetails, watchDetail)
	}

	c.JSON(200, watchDetails)
}
