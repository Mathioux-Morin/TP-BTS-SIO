# 😂 TP SIO — Générateur de blagues avec JokeAPI

Bienvenue dans ce TP dédié à la **consommation d’API** et à la **programmation HTML/JavaScript**. L’objectif est simple : **interroger la JokeAPI**, récupérer des blagues en français, puis **les afficher dynamiquement** dans un tableau avec options de suppression et de vidage.

---

## 🎯 Objectifs pédagogiques

- Savoir consommer une API REST depuis le navigateur avec `fetch`  
- Manipuler une réponse JSON et parcourir un tableau d’objets  
- Générer dynamiquement du DOM (lignes de tableau, boutons) en JavaScript  
- Gérer l’UX : messages d’erreur, vidage du tableau, suppression d’éléments  
- Préparer le projet pour un déploiement sur GitHub Pages

---

## 🛠️ Technologies utilisées

| Outil | Description |
|--------------------|--------------------------------------|
| **HTML5 / CSS3**   | Structure et mise en page (Bootstrap 5 CDN) |
| **JavaScript**     | Requêtes API, traitement JSON, génération DOM |
| **JokeAPI**        | Source des blagues (https://v2.jokeapi.dev) |
| **Bootstrap 5**    | Styles et composants UI via CDN |
| **VS Code**        | Environnement de développement |

---

## 📦 Contenu du TP

1. **Création d’une page HTML** avec un formulaire (recherche, catégorie, type) et un tableau d’affichage  
2. **Construction dynamique de l’URL** JokeAPI (lang, blacklistFlags, type, contains, amount)  
3. **Appel à l’API** via `fetch()` et gestion des réponses (200 / erreurs)  
4. **Parsing de la réponse** et insertion des blagues dans le tableau (génération de `<tr>`)  
5. **Fonctionnalités d’édition** : suppression individuelle et vidage complet du tableau  
6. **Gestion d’erreurs UX** : affichage d’une alerte si aucune blague n’est trouvée

👩‍💻 *Projet réalisé dans le cadre du BTS SIO SLAM — Lycée Fénelon*

