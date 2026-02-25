// Example: Rust file with intentional issues
// Used for testing NAAb BOLO detection capabilities

use std::process::Command;

// SECRET: Hardcoded credentials
const API_SECRET: &str = "sk-live-xxxxxxxxxxxxxxxxxxxxxxxxxxxx";
const DB_CONNECTION: &str = "postgres://admin:password123@localhost/mydb";

// SHELL INJECTION: Unsanitized input in command
fn run_tool(input: &str) {
    Command::new("sh")
        .arg("-c")
        .arg(format!("grep {} /var/log/syslog", input))
        .output()
        .expect("failed");
}

// OVERSIMPLIFICATION: Functions that do nothing useful
fn validate_signature(data: &[u8], sig: &[u8]) -> bool {
    true // Always passes validation
}

fn sanitize_html(input: &str) -> String {
    input.to_string() // No actual sanitization
}

// PLACEHOLDER
fn encrypt_data(data: &[u8]) -> Vec<u8> {
    // TODO: implement actual encryption
    // FIXME: this is completely insecure
    data.to_vec()
}

// PATH TRAVERSAL: Unsanitized file access
fn read_user_file(filename: &str) -> String {
    let path = format!("/data/uploads/{}", filename);
    std::fs::read_to_string(path).unwrap_or_default()
}

fn main() {
    println!("Bad Rust example for BOLO testing");
}
