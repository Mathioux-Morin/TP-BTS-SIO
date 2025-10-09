# Serveur Backend Pokedex

Ce projet est un serveur backend simple pour une application Pokédex, développé avec Node.js et Express. Il fournit une API REST pour accéder aux données des Pokémon.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé [Node.js](https://nodejs.org/) sur votre machine.

## Installation

1. Clonez ce dépôt sur votre machine locale :
   ```bash
   git clone <url-du-depot>
   ```
2. Accédez au répertoire du projet :
   ```bash
   cd <nom-du-dossier>
   ```
3. Installez les dépendances du projet :
   ```bash
   npm install
   ```

## Lancement du serveur

Pour démarrer le serveur, exécutez la commande suivante :

```bash
node index.js
```

Le serveur sera alors accessible à l'adresse `http://172.16.198.1:5001`.

## Documentation de l'API

L'API expose les points de terminaison suivants :

### `GET /`

Retourne la liste complète de tous les Pokémon au format JSON.

**Exemple de réponse :**
```json
[
  {
    "id": 1,
    "name": {
      "english": "Bulbasaur",
      "japanese": "フシギダネ",
      "chinese": "妙蛙种子",
      "french": "Bulbizarre"
    },
    "type": ["Grass", "Poison"],
    "base": {
      "HP": 45,
      "Attack": 49,
      "Defense": 49,
      "Sp. Attack": 65,
      "Sp. Defense": 65,
      "Speed": 45
    }
  },
  ...
]
```

### `GET /hasard`

Retourne un Pokémon aléatoire de la base de données.

**Exemple de réponse :**
```json
{
  "id": 25,
  "name": {
    "english": "Pikachu",
    "japanese": "ピカチュウ",
    "chinese": "皮卡丘",
    "french": "Pikachu"
  },
  "type": ["Electric"],
  "base": {
    "HP": 35,
    "Attack": 55,
    "Defense": 40,
    "Sp. Attack": 50,
    "Sp. Defense": 50,
    "Speed": 90
  }
}
```

### `GET /pokemon/id/:id`

Retourne un Pokémon spécifique en fonction de son `id`.

- `:id` (entier) : L'identifiant unique du Pokémon.

**Exemple d'utilisation :**
```
/pokemon/id/1
```

### `GET /pokemon/nom/:name`

Retourne un Pokémon spécifique en fonction de son nom (en français, anglais, japonais ou chinois).

- `:name` (chaîne de caractères) : Le nom du Pokémon.

**Exemple d'utilisation :**
```
/pokemon/nom/Pikachu
```

## Structure des dossiers

- **`DATA/`** : Ce dossier contient les fichiers de données au format JSON qui alimentent le Pokédex.
  - `pokedex.json` : La base de données principale des Pokémon.
  - `moves.json` : Informations sur les attaques.
  - `items.json` : Informations sur les objets.
  - `types.json` : Informations sur les types de Pokémon.

- **`FILES/`** : Ce dossier contient les ressources statiques.
  - `images/` : Images des Pokémon.
  - `sprites/` : Sprites des Pokémon.
  - `thumbnails/` : Miniatures des Pokémon.