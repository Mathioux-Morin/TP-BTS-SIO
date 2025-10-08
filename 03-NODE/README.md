# TP 1

## [Adresse du serveur](http://172.16.198.1:8085)

## Mission 1

**Commande permettant d'afficher les ports utilisés :** netstat -plntu
**Commande permettant d'afficher les ports ouverts sur une machie distante :** nmap -Pn adresse_ip

Suite au démarrage du serveur, on remarque qu'une page html a été créée et contient le texte mis dans res.end() dans app.js
La page ne change pas au raffraichissement après modification de app.js car il faut relancer la commande "node app.js" pour actualiser. L'app permet simplement de lancer le serveur, pas de le maintenir à jour comme pour un .html/.php
Le code 200 est un code HTTP et correspond au statut de la page, ici 200 signifie que tout va bien.

Au lancement de "nodemon app.js" on remarque d'abord que la console nous retourne des informations comparé à "node app.js". Maintenant, à tout changement opéré, la page est automatiquement actualisée, cependant elle n'est pas sous norme UTF-8.

## Mission 2

Suite à l'ajout du code "const page...", on remarque que console.log() ne s'affiche pas dans la console du site mais plutot dans la console de notre machine qui de lancement de l'app.
Après ajout de "?test=btssioslam" à la fin de l'url, rien ne change à part le nom de la page.
console.info() ressemble à console.log() mais est plutot utilisé pour les informations, ensuite il y a console .warn (affiche en orange), .error (affiche en rouge), .debug (affiche des messages cachés),... 

## Mission 3

La récupération de paramètres fait qu'à chaque changement du param name dans l'url, la page s'adapte et affiche le nom entré.
En ajoutant un paramètre age dans l'url (name=btssioslam&age=5) on peut maintenant l'afficher : 
<img width="271" height="35" alt="image" src="https://github.com/user-attachments/assets/61a9b3ae-f905-4da9-9143-32de8c6ccdf5" />

Tout fonctionne, le tp est terminé.

# TP 2

## [Adresse du serveur](http://172.16.198.1:5001)
