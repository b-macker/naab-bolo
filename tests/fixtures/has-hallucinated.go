package main

// Test fixture: Known hallucinated API violations
import (
	"fmt"
	"os"
	"strings"
)

func main() {
	// These API calls don't exist in Go stdlib
	data, _ := os.ReadFileAsync("test.txt")
	result := strings.RemoveAll(string(data), " ")
	output := fmt.FormatJSON(result)
	config := os.GetConfigMap()
	parsed := strings.ParseCSV(output)
	fmt.Println(config, parsed)
}
