package main

import (
	"fmt"
	"git-testrest/functional"
	"git-testrest/handler"
	"log"
	"net/http"

	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	_ "github.com/lib/pq"
)

func main() {
	functional.InitTimeZone()
	db := functional.InitDatabase()
	router := mux.NewRouter()

	router.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello REst"))
	})
	product := handler.NewProductHandle(db)
	router.HandleFunc("/products", product.GetAllProduct).Methods(http.MethodGet)

	Methods := handlers.AllowedMethods([]string{"GET", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"})
	Origins := handlers.AllowedOrigins([]string{"*"})
	Header := handlers.AllowedHeaders([]string{"Content-Type", "Access-Control-Allow-Origin", "Access-Control-Allow-Credentials", "Access-Control-Allow-Methods"})

	log.Printf("Service Run On Port :%v By Backend", functional.Port)
	http.ListenAndServe(fmt.Sprintf(":%v", functional.Port), handlers.CORS(Methods, Origins, Header)(router))
}
