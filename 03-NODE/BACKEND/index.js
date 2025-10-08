/**
* Serveur Backend Pokedex
*/
//console.log ("Hello World!");
// Définir l'emplacement des fichiers bases de données
const POKEDEX_SRC = "./DATA/pokedex.json";
// Définir l'emplacement des images
const IMAGES_SRC = "./FILES/images";
// Définir un port
const PORT = 5001;
// ************************************************
// Lancer un serveur express sur un port défini
const fs = require('fs');
// npm install express
const express = require('express');
const app = express();
app.get('/', (req, res) => {
    fs.readFile('./DATA/pokedex.json', 'utf8', (err, data) => {
        if (err) {
            console.error("Erreur de lecture du fichier :", err);
            res.status(500).send("Erreur serveur : impossible de lire le pokedex.");
        } else {
            const pokedex = JSON.parse(data);
            res.json(pokedex);
        }
    });
});
// Lancement du serveur et attendre
app.listen(
	PORT,
	'172.16.198.1',
	() => {
		console.log('Server Pokedex is listening on ' + PORT);
	}
)
