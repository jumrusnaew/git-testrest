package handler

import (
	"encoding/json"
	"fmt"
	"git-testrest/functional"
	"net/http"
	"strconv"
	"strings"

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
	queryString := r.URL.Query()

	filterGendor := strings.ToLower(queryString.Get("gendor"))
	filterStyle := strings.ToLower(queryString.Get("style"))
	filterSize := strings.ToLower(queryString.Get("size"))
	rowAmount := queryString.Get("row_amount")
	page := queryString.Get("page")
	query := "SELECT product, gendor_en, size, style, price FROM product "
	filterCase := 0
	if filterGendor != "" {
		query += "WHERE (LOWER(gendor_en) = $1) "
		filterCase = 1
	}
	if filterStyle != "" {
		if filterCase > 0 {
			query += "AND (LOWER(style) LIKE '%' || $2 || '%') "
			filterCase = 2
		} else {
			query += "WHERE (LOWER(style) LIKE '%' || $1 || '%') "
			filterCase = 3
		}
	}
	if filterSize != "" {
		if filterCase > 0 {
			if filterCase == 1 {
				query += "AND (LOWER(size) = $2) "
				filterCase = 4
			} else if filterCase == 2 {
				query += "AND (LOWER(size) = $3) "
				filterCase = 5
			} else if filterCase == 3 {
				query += "AND (LOWER(size) = $2) "
				filterCase = 6
			}
		} else {
			query += "WHERE (LOWER(size) = $1) "
			filterCase = 7
		}
	}
	if rowAmount != "" {
		if page != "" {
			query += "OFFSET 0 LIMIT " + rowAmount
		} else {
			p, _ := strconv.Atoi(page)
			a, _ := strconv.Atoi(rowAmount)
			ofs := (p - 1) * a
			oft := strconv.Itoa(ofs)
			query += "OFFSET " + oft + " LIMIT " + rowAmount
		}
	} else {
		if page != "" {
			p, _ := strconv.Atoi(page)
			ofs := (p - 1) * 20
			oft := strconv.Itoa(ofs)
			query += "OFFSET " + oft + " LIMIT 20"
		}
	}
	query += " ;"
	res := []ProductProperties{}
	if filterCase == 0 {
		err := repo.db.Select(&res, query)
		if err != nil {
			functional.Log(err)
			handleError(w, "Can not Get data FromDatabase")
			return
		}
	} else if filterCase == 1 {
		err := repo.db.Select(&res, query, filterGendor)
		if err != nil {
			functional.Log(err)
			handleError(w, "Can not Get data FromDatabase")
			return
		}
	} else if filterCase == 2 {
		err := repo.db.Select(&res, query, filterGendor, filterStyle)
		if err != nil {
			functional.Log(err)
			handleError(w, "Can not Get data FromDatabase")
			return
		}
	} else if filterCase == 3 {
		err := repo.db.Select(&res, query, filterStyle)
		if err != nil {
			functional.Log(err)
			handleError(w, "Can not Get data FromDatabase")
			return
		}
	} else if filterCase == 4 {
		err := repo.db.Select(&res, query, filterGendor, filterSize)
		if err != nil {
			functional.Log(err)
			handleError(w, "Can not Get data FromDatabase")
			return
		}
	} else if filterCase == 5 {
		err := repo.db.Select(&res, query, filterGendor, filterStyle, filterSize)
		if err != nil {
			functional.Log(err)
			handleError(w, "Can not Get data FromDatabase")
			return
		}
	} else if filterCase == 6 {
		err := repo.db.Select(&res, query, filterStyle, filterSize)
		if err != nil {
			functional.Log(err)
			handleError(w, "Can not Get data FromDatabase")
			return
		}
	} else {
		err := repo.db.Select(&res, query, filterSize)
		if err != nil {
			functional.Log(err)
			handleError(w, "Can not Get data FromDatabase")
			return
		}
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(res)

}
