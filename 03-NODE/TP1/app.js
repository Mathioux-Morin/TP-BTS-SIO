// Importer le module http
// Il contient toutes les méthodes necessaires
// pour la création d'un serveur ainsi que des requêtes HTTP
const querystring = require('querystring')
const http = require('http');
const url = require('url');
// Création du serveur
const server = http.createServer(
// Fonction anonyme qui "récupère" de la méthode http.createServer
// les paramètres req: REQUEST et res: RESPONSE
	function(req, res)
	{
		const params = querystring.parse(url.parse(req.url).query);
		if("name" in params) {
			res.end("Bonjour " + params.name + ", vous avez " + params.age + " ans !");
		}else {
			res.end("Bonjour inconnu");
		}
		const page = url.parse(req.url).pathname;
		console.log("Page : " + page);
		res.writeHead(200, {"Content-Type": "text/plain"});
	}
);
// Démarrage du serveur sur le port 8085
server.listen(8085);
