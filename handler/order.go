package handler

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/jmoiron/sqlx"
)

func handleError(w http.ResponseWriter, e string) {

	w.WriteHeader(http.StatusInternalServerError)
	fmt.Fprintln(w, e)

}

type repoDB struct {
	db *sqlx.DB
}
type ProductProperties struct {
	Product_No string  `db:"product"`
	Gendor     string  `db:"gendor_en"`
	Size       string  `db:"size"`
	Style      string  `db:"style"`
	Price      float32 `db:"price"`
}
type ProductMethod interface {
	GetAllProduct(http.ResponseWriter, *http.Request)
}

func NewProductHandle(db *sqlx.DB) ProductMethod {
	return repoDB{db: db}
}

func (repo repoDB) GetAllProduct(w http.ResponseWriter, r *http.Request) {
	/*
		=> Validate Command <=
	*/
	query := "SELECT product, gendor_en, size, style, price FROM product;"
	res := []ProductProperties{}
	err := repo.db.Select(&res, query)
	if err != nil {
		log.Println(err)
		handleError(w, "Can not Get data FromDatabase")
		return
	}
	json.NewEncoder(w).Encode(res)

}
