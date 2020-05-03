package main

import (
    "fmt"
    "net/http"
    "os"
)

func main() {
    http.HandleFunc("/", HelloServer)
    http.ListenAndServe(":8080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
    n, _ := os.Hostname()
    fmt.Fprintf(w, "Hola %s, te respondo desde %s!", r.URL.Path[1:], n)
}

