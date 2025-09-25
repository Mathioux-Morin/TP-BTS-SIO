//inititialisation de la carte
var map = L.map('map').setView([-21.1258,55.5256], 11);

//Config
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

// Nouvelle icône personnalisée
var pinIconRando = L.icon({
    iconUrl: 'assets/images/icones/pinRandonnee.png',
    iconSize: [128, 128], // Taille de l'icône
    iconAnchor: [64, 90], // Point d'ancrage de l'icône
    popupAnchor: [0, -48] // Position du popup par rapport à l'icône
});

datas.forEach(
    (data) => 
        {
        if (data.location != null)
            {
            //Ajout des marqueurs avec l'icône personnalisée
            L.marker([data.location.lat, data.location.lon], { icon: pinIconRando }).addTo(map)
            .bindPopup("<b> Nom : </b>" + data.nom + 
                "</br><b>Durée : </b>" + data.duree_minutes_total + " min</br>" +
                "<b>Zone : </b>" + data.zone_translations_item_nom +
                "</br><b>Sentier ouvert :</b>" + data.is_ouvert)
            .openPopup();
            }
        }
);