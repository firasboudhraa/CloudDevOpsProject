// tests/hello.unit.test.js
const express = require('express');
const request = require('supertest');

describe('hello router', () => {
  test('responds on /', async () => {
    const app = express();
    app.use('/hello', require('../routes/hello'));

    const res = await request(app).get('/hello');
    expect(res.status).toBe(200);
    expect(res.text).toBeTruthy();
  });
});
