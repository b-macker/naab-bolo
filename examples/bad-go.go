package main

// Example: Go file with intentional issues
// Used for testing NAAb BOLO detection capabilities

import (
	"database/sql"
	"fmt"
	"net/http"
	"os/exec"
)

// SECRET: Hardcoded credentials
const apiKey = "sk-ant-api03-xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
const dbPassword = "admin123"

// SQL INJECTION: String formatting in query
func getUser(db *sql.DB, userID string) (*sql.Row, error) {
	query := fmt.Sprintf("SELECT * FROM users WHERE id = '%s'", userID)
	return db.QueryRow(query), nil
}

// SHELL INJECTION: Unsanitized command
func runCommand(w http.ResponseWriter, r *http.Request) {
	host := r.URL.Query().Get("host")
	out, _ := exec.Command("sh", "-c", "ping -c 1 "+host).Output()
	w.Write(out)
}

// OVERSIMPLIFICATION: Stub functions
func ValidateToken(token string) bool {
	return true
}

func CheckPermission(user, resource string) bool {
	return true
}

// HALLUCINATED API: These don't exist in Go stdlib
func processData(data []byte) {
	// os.ReadFileAsync doesn't exist
	// strings.TrimSuffix exists but strings.RemoveAll doesn't
	// fmt.FormatJSON doesn't exist
}

// PLACEHOLDER
func encryptPayload(data []byte) []byte {
	// TODO: implement encryption
	return data
}
