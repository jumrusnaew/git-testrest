package main

import (
	"git-testrest/functional"

	_ "github.com/lib/pq"
)

func main() {
	functional.InitTimeZone()
	db := functional.InitDatabase()

}
