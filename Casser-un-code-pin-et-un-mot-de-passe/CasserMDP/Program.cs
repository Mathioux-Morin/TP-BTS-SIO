

namespace CasserMDP
{
    class Program
    {
        public static void Main(string[] args)
        {
            DateTime start = DateTime.Now;
            Random rnd = new Random();
            // génère un code ASCII entre 97 et 122
            string motDePasseHasard = "";
            for (int j = 0; j < 3; j++)
            {
                int codeASCII = rnd.Next(97, 122);
                motDePasseHasard = motDePasseHasard + (char)codeASCII;
            }
            bool trouve = false;

            for (int i = 97; i < 123 && !trouve; i++)
            {
                
                for (int j = 97; j < 123 && !trouve; j++)
                {
                    for (int k = 97; k < 123 && !trouve; k++)
                    {
                        String mot = "" + (char)i + (char)j + (char)k; // conversion de l'entier en caractère
                        System.Console.WriteLine(mot); // affichage du caractère
                        if (mot == motDePasseHasard)
                        {
                            System.Console.WriteLine("Mot de passe trouvé : " + mot);
                            trouve = true;
                        }
                    }
                }
            }
            TimeSpan duree = DateTime.Now - start;
            Console.WriteLine("Durée : " + duree);
            Console.Write("Press any key to continue . . . ");
            Console.ReadKey(true);

        }
    }
}