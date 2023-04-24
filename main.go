package main

import (
	"fmt"
	"net/http"
)

// handler function
func hello(writer http.ResponseWriter, request *http.Request) {
	fmt.Fprintf(writer, "Hello World, %s!", request.URL.Path[1:])
}

func main() {
	http.HandleFunc("/", hello)       // register the path & handler method to default multi plexer
	http.ListenAndServe(":1323", nil) // ListenAndServe in the case of use default multi plexer, put nill second argument
}
