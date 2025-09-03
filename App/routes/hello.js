const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.send('👋 Hello from Firas Boudhraa’s Node.js API!');
});

module.exports = router;
