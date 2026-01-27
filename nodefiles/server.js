const express = require('express');
const path = require('path');
const app = express();
let counter = 0;

// Serve index.html when user visits "/"
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// API endpoint for counter
app.get('/counter', (req, res) => {
  counter++;
  res.json({ count: counter });

  if (counter >= 5) {
    console.log("Instance reached 5 requests, shutting down...");
    process.exit(0); // simulate "instance full"
  }
});

app.listen(8080, () => console.log('Server running on port 8080'));

