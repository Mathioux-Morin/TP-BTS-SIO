//inititialisation de la carte
var map = L.map('map').setView([-21.1258,55.5256], 11);

//Config
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

// Nouvelle icône personnalisée
var pinIconRando = L.icon({
    iconUrl: 'assets/images/icones/pinFormation.png',
    iconSize: [128, 128], // Taille de l'icône
    iconAnchor: [64, 90], // Point d'ancrage de l'icône
    popupAnchor: [0, -48] // Position du popup par rapport à l'icône
});

datas.forEach(
    (data) => 
        {
        //Ajout des marqueurs avec l'icône personnalisée
        L.marker([data.etab_gps.lat, data.etab_gps.lon], { icon: pinIconRando }).addTo(map)
        .bindPopup("<b> Nom de formation: </b>" + data.fl[0] + 
            "</br><b>Nom de l'établissement : </b>" + data.etab_nom +
            "<b>Commune : </b>" + data.commune +
            "</br><b>Type d'établissement :</b>" + data.tc)
        .openPopup();
        }
);