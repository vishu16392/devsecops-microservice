// index.js - very small express app
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// DB connection should use MONGODB_URI from env (do NOT hardcode)
const mongoUri = process.env.MONGODB_URI || null;

app.get('/', (req, res) => {
  res.send('Hello — secure microservice (test)');
});

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.listen(port, () => {
  console.log(`listening ${port}`);
});
