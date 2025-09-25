// Définir le endpoint

let endpoint = "https://randomuser.me/api/?results=50"

//1. Faire une requête auprès de l'API RandomUser

fetch( endpoint )
.then(
    // Fonction de Callback anonyme
    function(response){
        // Affichage de la réponse
        if (response.status == 200){
            response.json()
            .then(
                function (datas){
                    
                    let users = datas.results;
                    console.log(datas.results);
                    let tabUser = document.getElementById('userLines');

                    users.forEach(
                        function (user) {
                            console.log(user.name.first + " " + user.name.last)
                            tabUser.appendChild( generateUserLine(user) );
                        }
                        );
                    
                }
            )
        } else {
            console.log("Une erreur est survenue " + response.status)
        }
    }
)

// Choix de l'icone en fonction du genre en HTML pour pouvoir changer la taille de la police.
function getGenderIcon(genre) {
    if (genre === 'female') {
        return '<span class="fs-1">👩</span>';
    } else if (genre === 'male') {
        return '<span class="fs-1">👨</span>';
    } else {
        return '<span class="fs-1">❓</span>'; // Icône pour genre non spécifié
    }
}


// Documenter le code
/**
 * Fonction qui génère une ligne de tableau
 * @param {*} userData 
 */

function generateUserLine(userData)
{
    // Création des éléments HTML

    //balise tr
    let generatedUserLine = document.createElement("tr");

    //balises
    let tdID = document.createElement("td");

    let tdGenre = document.createElement("td");

    let tdNom = document.createElement("td");

    let tdPhoto = document.createElement("td");
    let photo = document.createElement("IMG");
    photo.src = userData.picture.medium;

    let tdVille = document.createElement("td");
    let tdPays = document.createElement("td");
    let tdPaysDrapeau = document.createElement("td");
    let flag = document.createElement("IMG");
    // Utilisation des ressources de FlagCDN
    flag.src = `https://flagcdn.com/48x36/${userData.nat.toLowerCase()}.png`;

    // Personnalisation des colonnes
    tdID.innerText = userData.login.username;

    tdGenre.innerHTML = getGenderIcon(userData.gender);

    tdNom.innerText = userData.name.title + " " + userData.name.first.toUpperCase() + " " + userData.name.last;

    tdPhoto.appendChild(photo);

    tdVille.innerText = userData.location.city;
    tdPays.innerText = userData.location.state;
    tdPaysDrapeau.appendChild(flag);
    
    // Filliation
    generatedUserLine.appendChild(tdID);
    generatedUserLine.appendChild(tdGenre);
    generatedUserLine.appendChild(tdNom);
    generatedUserLine.appendChild(tdPhoto);
    generatedUserLine.appendChild(tdVille);
    generatedUserLine.appendChild(tdPays);
    generatedUserLine.appendChild(tdPaysDrapeau);

    return generatedUserLine;
}
