package connection

import (
	"database/sql"
	"fmt"
	"backend/connection/queries"
	_ "github.com/lib/pq" 
	"log"
)

var DB *sql.DB

func InitDB(host string, port string, user string, password string, dbname string) {
	connStr := "host=" + host + " port=" + port + " user=" + user + " password=" + password + " dbname=" + dbname

	fmt.Println(connStr)

	db, err := sql.Open("postgres", connStr)
	if err != nil {
		fmt.Println(err)
	}

	err = db.Ping()
	if err != nil {
		fmt.Println(err)
	}

	DB = db
}

func GetDB() *sql.DB {
	err := DB.QueryRow(queries.GET_WATCH_DETAILS).Scan(&DB)
	if err != nil {
		fmt.Println(err)
	}
	log.Println("Get watch details success")
	return DB
}
