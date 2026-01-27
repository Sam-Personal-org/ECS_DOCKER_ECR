const express = require('express');
const app = express();
let counter = 0;

app.get('/', (req, res) => {
  counter++;
  res.send(`<h1>Request Number: ${counter}</h1>`);
  if (counter >= 5) {
    process.exit(0); // simulate "instance full" by killing container
  }
});

app.listen(8080, () => console.log('Server running on port 8080'));

