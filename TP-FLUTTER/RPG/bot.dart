import 'joueur.dart';
import 'dart:math';

class Bot{
  // Initialisation
  String _nameBot = '';
  double _force = 0;
  double _vie = 0;

  void attaque(Joueur victime, int scoreDes)
  {
    //instancier les infos actuelles du receveur
    String victimeName = victime.GetPseudo();
    double victimeHealth = victime.GetHealth();

    // Calcul des dégâts
    print('\x1b[38;5;9m${this._nameBot}\x1b[0m lance les dés...');
    print('$scoreDes !');
    double damages = (scoreDes * this._force * 100).round() / 100;

    // Attaque
    print('\x1b[38;5;9m${this._nameBot}\x1b[0m titille \x1b[38;5;29m${victimeName}\x1B[0m de \x1B[31m${damages} points de dégats\x1B[0m');
    victime.SetHealth(victimeHealth - damages);    
    if (victimeHealth < 0)
    {
      victime.SetHealth(0);
    }
    victimeHealth = victime.GetHealth();
    print('${victimeName} - \x1B[32mSanté ${victimeHealth}%\x1B[0m');
  }

  // Getters et Setters

  String GetName()
  {
    return this._nameBot;
  }

  void SetName(String arg)
  {
    this._nameBot = arg;
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
