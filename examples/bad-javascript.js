// Example: JavaScript file with intentional security issues
// Used for testing NAAb BOLO detection capabilities

const express = require('express');
const app = express();

// SECRET: Hardcoded tokens
const API_TOKEN = "ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
const JWT_SECRET = "super-secret-key-do-not-share";

// SQL INJECTION: String concatenation in queries
app.get('/user/:id', (req, res) => {
    const query = "SELECT * FROM users WHERE id = " + req.params.id;
    db.query(query, (err, results) => {
        res.json(results);
    });
});

// SQL INJECTION: Template literal in query
app.post('/search', (req, res) => {
    const q = `SELECT * FROM products WHERE name LIKE '%${req.body.term}%'`;
    db.query(q);
});

// SHELL INJECTION: User input in exec
const { exec } = require('child_process');
app.get('/ping/:host', (req, res) => {
    exec('ping -c 1 ' + req.params.host, (err, stdout) => {
        res.send(stdout);
    });
});

// OVERSIMPLIFICATION: Empty implementations
function validatePayment(amount, card) {
    return true;
}

function sanitizeInput(input) {
    return input; // No actual sanitization
}

// PATH TRAVERSAL: Unsanitized file path
app.get('/file/:name', (req, res) => {
    const filepath = '/data/' + req.params.name;
    res.sendFile(filepath);
});

// INFORMATION DISCLOSURE: Stack trace in response
app.use((err, req, res, next) => {
    res.status(500).json({
        error: err.message,
        stack: err.stack  // Exposes internals
    });
});
