// Test fixture: Mixed violations across categories
use std::process::Command;

// SECRET
const API_KEY: &str = "sk-live-xxxxxxxxxxxxxxxxxxxxxxxxxxxx";
const DB_URL: &str = "postgres://admin:password123@localhost/db";

// SHELL INJECTION
fn run_cmd(input: &str) {
    Command::new("sh").arg("-c").arg(format!("echo {}", input)).output().ok();
}

// OVERSIMPLIFICATION
fn validate(data: &str) -> bool { true }
fn sanitize(input: &str) -> String { input.to_string() }

// PLACEHOLDER
fn encrypt(data: &[u8]) -> Vec<u8> {
    // TODO: implement real encryption
    // FIXME: completely insecure
    data.to_vec()
}

fn main() {}
