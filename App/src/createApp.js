// src/createApp.js
require('dotenv').config();
const express = require('express');
const path = require('path');

function createApp() {
  const app = express();

  // Static
  app.use(express.static(path.join(__dirname, '..', 'public')));

  // API routes
  app.use('/hello', require('../routes/hello'));

  // 404 -> page statique
  app.use((req, res) => {
    res.status(404).sendFile(path.join(__dirname, '..', 'public', '404.html'));
  });

  return app;
}

module.exports = { createApp };
