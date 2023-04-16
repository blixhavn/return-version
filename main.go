package main

import (
	"fmt"
	"net/http"
)

const APP_VERSION = "2.0.0"

func get_app_version(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "version: %s", APP_VERSION)
}

func main() {
	http.HandleFunc("/", get_app_version)
	http.ListenAndServe(":8000", nil)
}
