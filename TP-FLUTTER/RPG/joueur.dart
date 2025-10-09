import 'bot.dart';
import 'dart:math';
import 'dart:io';

class Joueur 
{
  // Initialisation
  String _pseudo = "";
  double _force = 0;
  double _vie = 0;

  void attaque(Bot victime, int scoreDes)
  {
    // Instancier les infos actuelles du receveur
    String victimeName = victime.GetName();
    double victimeHealth = victime.GetHealth();

    // Attendre le lancement des dés
    print('');
    print('\x1b[38;5;29m${this._pseudo}\x1B[0m, appuie sur \x1B[34m"entrée"\x1B[0m pour lancer les dés');
    stdin.readLineSync();

    // Calcul des dégâts
    print('\x1b[38;5;29m${this._pseudo}\x1b[0m lance les dés...');
    print ('$scoreDes !');
    double damages = (scoreDes * this._force * 100).round() / 100;

    // Attaque
    print('\x1b[38;5;29m${this._pseudo}\x1B[0m titille \x1b[38;5;9m${victimeName}\x1B[0m de \x1B[31m${damages} points de dégats\x1B[0m');
    victime.SetHealth(victimeHealth - damages);
    if (victimeHealth < 0)
    {
      victime.SetHealth(0);
    }
    victimeHealth = victime.GetHealth();
    print('${victimeName} - \x1B[32mSanté ${victimeHealth}%\x1B[0m');
  }

  // Getters et Setters

  String GetPseudo()
  {
    return this._pseudo;
  }

  void SetPseudo(String arg)
  {
    this._pseudo = arg;
  }

  double GetForce()
  {
    return this._force;
  }

  void SetForce(double arg)
  {
    this._force = arg;
  }

  double GetHealth()
  {
    return this._vie;
  }

  void SetHealth(double arg)
  {
    // Arrondissement au centième
    this._vie = (arg*100).round()/100;
  }
}
