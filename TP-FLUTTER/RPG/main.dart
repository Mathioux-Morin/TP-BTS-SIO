import 'dart:io';
import 'dart:math';
import 'bot.dart';
import 'joueur.dart';

// Fonction pour lancer les dés

int lancerDes(){
  var des = Random();
  int nombreAleatoire1 = des.nextInt(6) + 1;
  int nombreAleatoire2 = des.nextInt(6) + 1; 
  int resultat = nombreAleatoire1 + nombreAleatoire2;
  return resultat;
}

void attaque(String attaquant, String receveur, int score, int force, int vie){
  print('$attaquant lance les dés... : $score');
  print('$attaquant titille $receveur de \x1B[31m${score * force} points de dégats\x1B[0m');
  print('$receveur - Santé $vie%');
}

void main()
{
  // Initialisation des joueurs
  final joueur1 = Joueur();
  joueur1.force = 1;

  joueur1.vie = 100;

  final bot1 = bot();
  bot1.nameBot = 'Mastu';
  bot1.force = 1;
  bot1.vie = 100;

  // Demande de pseudo
    // Affichage rainbow pour "Rentre ton pseudo !"
    String rainbowText =
      '\x1B[31mR\x1B[33me\x1B[32mn\x1B[36mt\x1B[34mr\x1B[35me \x1B[31mt\x1B[33mo\x1B[32mn \x1B[36mp\x1B[34me\x1B[35ms\x1B[31mu\x1B[33md\x1B[32mo \x1B[36m!\x1B[0m';
    print(rainbowText);
    String pseudo = stdin.readLineSync()!;
    joueur1.pseudo = pseudo;

  // print de celui qui va commencer (au hasard)
  print('\x1B[36mQui va commencer ?\x1B[0m');
  String attaquant = Random().nextBool() ? joueur1.pseudo : bot1.nameBot;
  print('\x1B[1m$attaquant commence le combat !\x1B[0m');

  // Boucle de jeu
  for (int compteurTour = 1; bot1.vie > 0 && joueur1.vie > 0; compteurTour++) 
  {
    print('--- Tour $compteurTour ---');

    // Chaque joueur joue une fois
    for (int i = 0; i < 2; i++) 
    {
      if (attaquant == joueur1.pseudo)
      {
        // Tour du joueur
        print(''); // Ligne vide pour aérer l'affichage
        print('${joueur1.pseudo}, appuie sur \x1B[34m"entrée"\x1B[0m pour lancer les dés');
        stdin.readLineSync(); // Attente de l'entrée de l'utilisateur
        int scoreJoueur = lancerDes();
        int degatsJoueur = scoreJoueur * joueur1.force;
        bot1.vie -= degatsJoueur;

        //affichage des infos d'attaque
        attaque(joueur1.pseudo, bot1.nameBot, scoreJoueur, joueur1.force, bot1.vie);
        attaquant = bot1.nameBot;
      }
      else
      {
        // Tour du bot
        int scoreBot = lancerDes();
        int degatsBot = scoreBot * bot1.force;
        joueur1.vie -= degatsBot;
        attaque(bot1.nameBot, joueur1.pseudo, scoreBot, bot1.force, joueur1.vie);
        attaquant = joueur1.pseudo;
      }

      if (bot1.vie <= 0 || joueur1.vie <= 0) 
        {
          break;
        }
    }

  }

  
  if (bot1.vie <= 0) 
  {
    // Le bot a perdu
    print('\x1B[32mVous avez été le plus fort !\x1B[0m');
    return;
  }
  else 
  {
    // Le joueur a perdu
    print('\x1B[31mVous avez été sacrément nul !\x1B[0m');
    return;
  }
}