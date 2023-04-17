package main

import (
	"fmt"
	"net/http"
	"os"
)

const APP_VERSION = "1.0.0"

func get_app_info(w http.ResponseWriter, r *http.Request) {
	hostname := os.Getenv("HOSTNAME")
	fmt.Fprintf(w, "hostname: %s, version: %s", hostname, APP_VERSION)
}

func main() {
	http.HandleFunc("/", get_app_info)
	http.ListenAndServe(":8000", nil)
}
