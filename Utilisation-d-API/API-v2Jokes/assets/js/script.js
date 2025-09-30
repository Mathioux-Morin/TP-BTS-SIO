// Gestion du formulaire et appel à JokeAPI
document.addEventListener('DOMContentLoaded', function() {
    // Gestion du bouton pour vider le tableau
    const clearTableBtn = document.getElementById('clearTableBtn');
    if (clearTableBtn) {
        clearTableBtn.addEventListener('click', function() {
            let tabJokes = document.getElementById('jokeLines').getElementsByTagName('tbody')[0];
            tabJokes.innerHTML = '';
        });
    }
	const form = document.getElementById('jokeForm');
	const resultDiv = document.getElementById('jokeResult');

	form.addEventListener('submit', async function(e) {
		e.preventDefault();

        // Définition des variables à partir du formulaire
		const errorMessage = document.getElementById('errorMessage');
		const category = document.getElementById('category').value;
		const type = document.getElementById('type').value;
        const jokeLanguage = 'fr';
        const blackFlags = 'nsfw,religious,political,racist,sexist,explicit';
        const jokeSearch = document.getElementById('jokeSearch').value.trim();
        const amount = 10;

        // Création de l'url

		let url = `https://v2.jokeapi.dev/joke`;
        if(category !== 'any') {
            url += `/${category}`;
        }

        url += `?lang=${jokeLanguage}`;

        url += `&blacklistFlags=${blackFlags}`;

		if (type !== 'any') {
			url += `&type=${type}`;
		}

        if(jokeSearch) {
            url += `&contains=${encodeURIComponent(jokeSearch)}`;
        }
        url += `&amount=${amount}`;
        
       // récupération des données et ajout dans le tableau
       fetch( url )
        .then(
            // Fonction de Callback anonyme
            function(response){
                // Affichage de la réponse
                if (response.status == 200){
                    response.json()
                    .then(
                        function (datas){
                            let jokes = datas.jokes || datas.results || [];
                            console.log(jokes);
                            let tabJokes = document.getElementById('jokeLines').getElementsByTagName('tbody')[0];

                            // Nettoyer le tableau avant d'ajouter les nouvelles blagues
                            tabJokes.innerHTML = '';

                            if (jokes.length === 0) {
                                // Afficher le message d'erreur si aucune blague n'est trouvée
                                errorMessage.classList.remove('d-none');
                            } else {
                                // Cacher le message d'erreur si des blagues sont trouvées
                                errorMessage.classList.add('d-none');
                                jokes.forEach(function (joke) {
                                    tabJokes.appendChild(generateJokeLine(joke));
                                });
                            }
                            
                        }
                    )
                } else {
                    // Afficher le message d'erreur en cas d'erreur de l'API
                    errorMessage.classList.remove('d-none');
                    console.log("Une erreur est survenue " + response.status)
                }
            }
        )
        .catch(function(error) {
            // Afficher le message d'erreur en cas d'erreur réseau
            errorMessage.classList.remove('d-none');
            console.error("Erreur :", error);
        });

        
        // Documenter le code
        /**
         * Fonction qui génère une ligne de tableau
         * @param {*} userData 
         */

        // Fonction qui génère une ligne de tableau
        function generateJokeLine(jokeData)
        {
            // Création des éléments HTML

            //balise tr
            let generatedJokeLine = document.createElement("tr");
            //balises

            let tdCategory = document.createElement("td");

            let tdJoke = document.createElement("td");

            let tdEdit = document.createElement("td");
            let btnDelete = document.createElement('button');
            

            // Personnalisation des colonnes
            tdCategory.innerText = jokeData.category;

            if(jokeData.type === 'single') {
                tdJoke.innerText = jokeData.joke;
            } else if(jokeData.type === 'twopart') {
                tdJoke.innerText = jokeData.setup + " ... " + jokeData.delivery;
            } else {
                tdJoke.innerText = '-';
            }

            btnDelete.className = 'btn btn-danger';
            btnDelete.innerText = 'Supprimer la blague';
            btnDelete.onclick = function() {
                generatedJokeLine.remove();
            };
            tdEdit.appendChild(btnDelete);

            // Ajout des colonnes à la ligne
            generatedJokeLine.appendChild(tdCategory);
            generatedJokeLine.appendChild(tdJoke);
            generatedJokeLine.appendChild(tdEdit);

            return generatedJokeLine;
        }
	});
});
