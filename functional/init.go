package functional

import (
	"fmt"
	"time"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

func InitTimeZone() {
	ict, err := time.LoadLocation("Asia/Bangkok")
	if err != nil {
		panic(err)
	}
	time.Local = ict
}

func InitDatabase() *sqlx.DB {
	driver := "postgres"
	username := "posgres"
	password := "ppapppap"
	host := "localhost"
	database := "restdbtest"
	db, err := sqlx.Open(driver, fmt.Sprintf("%v://%v:%v@%v/%v",
		driver,
		username,
		password,
		host,
		database,
	))
	if err != nil {
		panic(err)
	}
	db.SetConnMaxLifetime(1 * time.Minute)
	db.SetMaxOpenConns(12)
	db.SetMaxIdleConns(12)
	return db
}
