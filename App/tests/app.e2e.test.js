const request = require('supertest');
const { createApp } = require('../src/createApp');
const path = require('path');
const fs = require('fs');

let app;

beforeAll(() => {
  app = createApp();
});

describe('Static files', () => {
  test('GET / serves index.html', async () => {
    const res = await request(app).get('/');
    expect(res.status).toBe(200);
    // Vérifie que le contenu ressemble à notre page (titre présent)
    expect(res.text).toMatch(/Firas Boudhraa/i);
  });
});

describe('/hello route', () => {
  test('GET /hello returns 200 and some text', async () => {
    const res = await request(app).get('/hello');
    expect(res.status).toBe(200);
    // pas d’hypothèse sur le texte exact → on s’assure qu’il y a du contenu
    expect(res.text).toBeTruthy();
  });
});

describe('404 handler', () => {
  test('GET /not-found returns 404 and serves custom 404 page', async () => {
    const res = await request(app).get('/not-found');
    expect(res.status).toBe(404);
    // optionnel : vérifier qu’on renvoie bien le contenu du fichier 404.html
    const file404 = fs.readFileSync(path.join(__dirname, '..', 'public', '404.html'), 'utf8');
    // On vérifie juste que quelque chose de la page est dedans
    const snippet = (file404 || '').slice(0, 40);
    if (snippet) {
      expect(res.text).toContain(snippet.trim().split(/\s+/)[0]);
    }
  });
});
