import 'dart:io';
import 'dart:math';
import 'bot.dart';
import 'joueur.dart';

void main()
{
  // Initialisation des joueurs
  Joueur player1 = Joueur();

  List<String> botNames = ["Mastu","Danielou","Hugo Decrypte","Mcfly","Carlito","Amixem","Joyca","Maghla","Davidfilsdemomone","Cyprien","SebLaFritte","Hctuan","Squeezie"];
  List<Bot> botList = [];
  int numBot = 0;

  void initPlayers(double forceJoueur, double vieJoueur, double vieBot, int lastUsed, int nbrBots, double botsForce)
  {
    player1.SetForce(forceJoueur);
    player1.SetHealth(vieJoueur);

    for (int i = 0 ; i < nbrBots ; i++)
    {
      Bot bot = Bot();
      botList.add(bot);
      
      botList[i].SetName(botNames[(i + lastUsed) % nbrBots]);
      botList[i].SetForce(botsForce);
      botList[i].SetHealth(vieBot);
    }
  }

  initPlayers(1, 100, 100, 0, 1, 1);

  String playerName = player1.GetPseudo();
  String botName =botList[Random().nextInt(botList.length)].GetName();
  // fonction de lancer de dés

  int lancerDes(){
    return Random().nextInt(6) + Random().nextInt(6) + 2;
  }

  // Fonction déterminant celui qui va commencer (au hasard)
  String firstAttaquant()
  {
    print('\x1B[36mQui va commencer ?\x1B[0m');
    String attaquant = Random().nextBool() ? playerName : botName;
    print('\x1B[1m$attaquant commence le combat !\x1B[0m');
    return attaquant;
  }

  int botChoicing(choicedOne)
        {
          if (botList.length != 1)
          {
            print('Qui voulez-vous\x1B[34m attaquer ?\x1B[0m');
            for (int i = 0 ; i < botList.length ; i++)
            {
              print('${i}. ${botList[i]}');
            }
            choicedOne = int.parse(stdin.readLineSync()!);
            if (choicedOne < 0 && choicedOne >= botList.length)
            {
              print('Ahah tu t\'es \x1B[34m trompé \x1B[0m j\'ai l\'impression ^^');
              botChoicing(0);
            }
          }
          return choicedOne;
        }

  // Combien de bots ont été battus
  int comboBotBattus = 0 ;

  // Demande de pseudo (le texte est multicolor)
  String rainbowText = '\x1B[31mR\x1B[33me\x1B[32mn\x1B[36mt\x1B[34mr\x1B[35me \x1B[31mt\x1B[33mo\x1B[32mn \x1B[36mp\x1B[34me\x1B[35ms\x1B[31mu\x1B[33md\x1B[32mo \x1B[36m!\x1B[0m';
  print(rainbowText);

  // stdin.readLineSync() sert à sauvegarder ce que l'utilisateur à écris et ! à vérifier que ce string est non nul
  String pseudo = stdin.readLineSync()!;
  player1.SetPseudo(pseudo);

  // Boucle de jeu
  void lancerPartie (int Tour,String attaquant)
  { 
    print('');
    print('\x1b[38;5;105m--------- Tour $Tour ---------\x1b[0m');
    print('');

    // Chaque joueur joue une fois
    for (int i = 0; i < 2; i++) 
    {
      int choicedOne = 0;
      if (attaquant == playerName)
      {
        // Tour du joueur
        choicedOne = botChoicing(0);
        player1.attaque(botList[choicedOne], lancerDes());
        if (botList[choicedOne].GetHealth() <= 0)
        {
          botList.removeRange(0, botList.length);
          comboBotBattus += 1;
          print(botList.length);
        }
        if (botList.length > 0)
        {
        attaquant = botList[(numBot + 1) % botList.length].GetName();
        }
      }
      else
      {
        // Tour du bot
        numBot = (numBot + 1) % botList.length;
        botList[numBot].attaque(player1, lancerDes());
        attaquant = playerName;
      }
      // Vérification avant de procéder au tour du prochain à jouer
      if (botList.length == 0 || player1.GetHealth() <= 0) 
        {
          break;
        }
    }

    if (botList.length == 0) 
    {
      // Victoire au joueur
      print('\x1B[32mVous avez été le plus fort !\x1B[0m');
      print('\x1B[34mUne nouvelle vague arrive !\x1B[0m');
      print('Votre \x1B[35mforce\x1B[0m augmente !');

      // calcul de la force du joueur
      double calculatedForce = player1.GetForce()+(comboBotBattus/player1.GetHealth());
      int nextBotsNbr = 1;
      double nextBotsForce = 0;

      if (calculatedForce.floorToDouble()!=calculatedForce)
      {
        if (calculatedForce.floorToDouble()<2)
        {
          nextBotsForce = calculatedForce;
        }
        else
        {
          nextBotsNbr = calculatedForce.ceil();
          nextBotsForce = calculatedForce.floorToDouble() / nextBotsNbr;
        }
      }
      botList.removeRange(0, botList.length);

      initPlayers(calculatedForce, 100, 100, comboBotBattus, nextBotsNbr, nextBotsForce);
      lancerPartie(Tour + 1, firstAttaquant());
    }
    else if (player1.GetHealth() <= 0)
    {
      // Le joueur a perdu
      print('\x1B[31mVous avez été sacrément nul !\x1B[0m');
      botList.removeRange(0, botList.length);

      // Relancer une partie ?
      print('');
      print('Voulez-vous\x1B[34m recommencer ?\x1B[0m [o/n]');
      if (stdin.readLineSync() == 'o')
      {
        initPlayers(1, 100, 100, 0, 1, 1);
        lancerPartie(1, firstAttaquant());
      }
    }
    else if (player1.GetHealth() > 0 && botList.length >0)
    {
      // La partie continue !
        lancerPartie(Tour+1, attaquant);
    }

  }
  lancerPartie(1, firstAttaquant());
}