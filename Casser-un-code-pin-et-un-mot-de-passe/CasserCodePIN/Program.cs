using System;
using System.Threading;

namespace CasserCodePin
{
    class Program
    {
        public static void Main(string[] args)
        {

            DateTime start = DateTime.Now;
            Console.WriteLine("Début du programme");
            Random rnd = new Random();
            int codeSecret = rnd.Next(9999);
            // booléen qui indique si on a trouvé le code secret
            bool trouve = false;
            // compteur de boucle
            int i = 0;
            while (i < 10000 && trouve == false)
            {
                Console.Write(i + " ");
                // si on trouve le code PIN, il faut afficher i et interrompre la boucle
                if (i == codeSecret)
                {
                    Console.WriteLine("\nCode PIN trouvé : " + i);
                    trouve = true;
                }
                Thread.Sleep(1000);
                i++;
            }
            Console.WriteLine("Fin du programme");
            // durée du programme = heure de fin - heure de démarrage
            TimeSpan duree = DateTime.Now - start;
            Console.WriteLine("durée du programme : " + duree);
            Console.Write("Press any key to continue . . . ");
            Console.ReadKey(true);

        }
    }
}