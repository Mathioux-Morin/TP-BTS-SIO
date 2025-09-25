# 🔐 L'attaque par Brute Force

## ❓ **Tout d'abord, qu'est-ce qu'une attaque par Brute Force ?**
Une attaque par Brute Force est une attaque visant à trouver le mot de passe d'un utilisateur en testant plusieurs mots de passe différents à la suite.
Cette attaque étant simple à mettre en place, elle est populaire auprès des pirates.

## 🧠 **Mais alors, comment font-ils ?**
Les pirates ont plusieurs méthodes pour attaquer par Brute Force. 
 - L'une consiste à récupérer un dictionnaire de mots de passe, qu'ils peuvent acheter chez un autre pirate qui a eu accès à une banque de données qui a fuité. Ils peuvent aussi prendre un dictionnaire de mots disponible gratuitement.
 - L'autre méthode est de générer des mots de passe, c'est à dire que chaque caractère et chaque combinaison de caractères seront testés. Cette méthode est cependant beaucoup plus longue car il existe plus de 149 000 caractères différents.

📊 *Photo illustrant le temps que prend une attaque Brute Force en fonction de la complexité du mot de passe :* 

<img width="500" height="500" alt="image" src="https://images.squarespace-cdn.com/content/v1/5ffe234606e5ec7bfc57a7a3/460ce679-5d87-4fa4-8151-39dd0446f4bf/2025+Hive+Systems+Password+Table?format=2500w" />

## ⚠️ **Quelles sont donc les conséquences possibles ?**
Les conséquences sont nombreuses, le pirate peut :
 - 📥 accéder à un compte, une base de données, un serveur ou encore un système.
 - 🕵️‍♂️ récupérer les données (personnelle, d'une base, etc) et donc enregistrer le mot de passe pour le revendre et/ou le réutiliser à d'autres endroits.
 - 🧨 saboter/modifier/supprimer des fichiers, projets, données et comptes.
 - 🦠 installer des logiciels malveillants (ransomware, spyware, etc)

## 📉 **Quel est le niveau de risque par rapport à la méthode EBIOS ?**
Le niveau de risque dépend de plusieurs facteurs : la source de l'attaque, la cible, la sécurité du système, etc.

<img width="859" height="459" alt="image" src="https://github.com/user-attachments/assets/0f2b94e0-1490-4c39-b0b3-f70915bed7e6" />

📌 Un niveau de risque moyen se situerait aux alentours de **"plutôt pertinent" à "très pertinent".**

## 🛡️ **Quelles sont donc les solutions ?!**
Pour éviter que nos mots de passes soient trouvés facilement :
 - ### 👤 **Côté utilisateur**
   - 🔄 Changer régulièrement le mot de passe au cas où il y aurait une fuite du côté du serveur.
   - 🚫 Ne pas mettre le même mot de passe sur plusieurs sites différents.
 - ### 🖥️ **Côté serveur**
   - ❌ Interdire des mots de passe contenant des mots, trop courts, considérés comme courant.
   - ✅ Obliger l'utilisateur à créer un mot de passe contenant des majuscules, des minuscules, des chiffres, des caractères spéciaux (ex : !µ%$£¤) et de plus de 7 caractères.
   - 🔐 Bloquer l'authentification à partir d'un certain nombre de tentatives manquées.
   - 📲 Proposer une authentification en deux facteur (Envoi d'un code temporaire par mail ou téléphone par exemple).
   - 👁️ Surveiller les connexions et prévenir l'utilisateur d'une connexion suspicieuse.

👩‍💻 *Projet réalisé dans le cadre du BTS SIO SLAM — Lycée Fénelon*
