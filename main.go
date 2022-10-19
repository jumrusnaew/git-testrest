package main

import (
	"fmt"
	"git-testrest/functional"
	"net/http"

	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	_ "github.com/lib/pq"
)

func main() {
	functional.InitTimeZone()
	db := functional.InitDatabase()
	_ = db
	router := mux.NewRouter()

	router.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello REst"))
	})

	Methods := handlers.AllowedMethods([]string{"GET", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"})
	Origins := handlers.AllowedOrigins([]string{"*"})
	Header := handlers.AllowedHeaders([]string{"Content-Type", "Access-Control-Allow-Origin", "Access-Control-Allow-Credentials", "Access-Control-Allow-Methods"})

	http.ListenAndServe(fmt.Sprintf(":%v", functional.Port), handlers.CORS(Methods, Origins, Header)(router))
}
