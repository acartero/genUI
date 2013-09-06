package fr.irisa.testk3;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.eclipse.emf.common.util.BasicEList;
import org.jenetics.BitChromosome;
import org.jenetics.BitGene;
import org.jenetics.GeneticAlgorithm;
import org.jenetics.Genotype;
import org.jenetics.Mutator;
import org.jenetics.NumberStatistics;
import org.jenetics.Optimize;
import org.jenetics.RouletteWheelSelector;
import org.jenetics.SinglePointCrossover;
import org.jenetics.util.Factory;
import org.jenetics.util.Function;












import fr.irisa.testk3.UI;


public class GenAlgo {
	

	/**
	 * Fonction principale du programme
	 * @param args
	 */
    public static void main(String[] args) {	
    	int populationSize = 40;
    	int numberOfGenerations = 40;
    	String fileName = "FirefoxOptions.xmi";
    	
    	/*
    	benchmark(populationSize, numberOfGenerations, fileName);
    	/*/
    	generation(populationSize, numberOfGenerations, fileName);//*/
    	
    }
	
	
	
	
	
	public static UI ui;
	static GeneticAlgorithm<BitGene, Integer> ga;
	/**
	 * Génération du meilleur individu trouvé
	 * @param numberOfGenerations
	 * @param populationSize
	 * @param fileName
	 */
    public static void generation(int numberOfGenerations, int populationSize, String fileName){
    	ui = new UI();
    	ui.init(fileName);
		ga = newGeneticAlgorithm(populationSize);
		int nbAffichage = 10;
    	if (nbAffichage > populationSize)
    		nbAffichage = populationSize;
    	for (int i = 0 ; i < nbAffichage ; i++)
        {
        	toFile("random" + i + ".html",(getHtmlCode(ga.getPopulation().get(i).getGenotype())));
        }
    	
        System.out.println("hey : " + evolve(numberOfGenerations,populationSize));

        System.out.println(ga.getBestStatistics());
        System.out.println(ga.getBestPhenotype().getFitness());
        
        toFile("test.html",(getHtmlCode(ga.getBestPhenotype().getGenotype())));
    }
    /**
     * Compare la génération aléatoire et l'algorithme génétique
     * @param numberOfGenerations
     * @param populationSize
     * @param fileName
     */
    public static void benchmark(int numberOfGenerations, int populationSize, String fileName){
    	ui = new UI();
    	ui.init(fileName);
        benchmark(numberOfGenerations, populationSize);
    }
    /**
     * Effectue la comparaison entre algorithme génétique et génération aléatoire
     * @param numberOfGenerations
     * @param populationSize
     */
    private static void benchmark(int numberOfGenerations, int populationSize){
    	List<Integer> randomList = new ArrayList<Integer>();
    	List<Integer> geneticList = new ArrayList<Integer>();
    	int nbTest = 10;
    	long lastDate;
    	long elapsedTime;
    	for(int i = 0; i < nbTest; i++)
    	{
        	lastDate = System.currentTimeMillis( );
    		randomList.add(testRandomPur(populationSize*numberOfGenerations, ui.size()));
    		elapsedTime = System.currentTimeMillis( ) - lastDate;
    		System.out.println("Test random " + i + " fait, temps d'execution : " + elapsedTime);
        	lastDate = System.currentTimeMillis( );
    		geneticList.add(evolve(numberOfGenerations,populationSize));
    		elapsedTime = System.currentTimeMillis( ) - lastDate;
    		System.out.println("Test génétique " + i + " fait, temps d'execution : " + elapsedTime);
    	}
    	int moyenneRandom = 0;
    	int moyenneGenetic = 0;
    	for(int i = 0; i < nbTest; i++)
    	{
    		moyenneRandom += randomList.get(i)/nbTest;
    		moyenneGenetic += geneticList.get(i)/nbTest;
    	}
    	
    	System.out.println("random scores: " + randomList + ", moyenne : " + moyenneRandom);
    	System.out.println("genetic scores: " + geneticList + ", moyenne : " + moyenneGenetic);
    }
    /**
     * Appel de l'algorithme génétique
     * @param numberOfGenerations
     * @return score du meilleur individu
     */
    private static int evolve(int numberOfGenerations, int populationSize){
    	ga = newGeneticAlgorithm(populationSize);
        ga.evolve(numberOfGenerations);
        return ga.getBestPhenotype().getFitness();
    }

    
    /**
     * Fonction testant la génération aléatoire
     * @param population
     * @param chromosomeSize
     * @return score du meilleur individu
     */
    private static int testRandomPur(int population, int chromosomeSize){
    	Random random = new Random();
    	int bestScore = 0;
    	//List<Boolean>  bestList = null;
    	for(int i = 0; i < population; i++){
            List<Boolean> list = new ArrayList<Boolean>();
            for (int j = 0; j < chromosomeSize; j++) {
            	list.add(random.nextBoolean());
            }
            BasicEList<Boolean> eList = new BasicEList<Boolean> (list); 
          
            int score = GenAlgo.ui.apply(eList);
    		if (score > bestScore)
    		{
    			bestScore = score;
    			//bestList = list;
    		}
    	}
    	return bestScore;
    }
    
    /**
     * Initialisation de l'algorithme génétique
     * @return Algorithme génétique initialisé, prêt à être utilisé
     */
    private static GeneticAlgorithm<BitGene, Integer> newGeneticAlgorithm(int populationSize){

        Factory<Genotype<BitGene>> gtf = Genotype.valueOf(
            new BitChromosome(ui.size(), 0.5)
        );
        Function<Genotype<BitGene>, Integer> ff = new OneCounter();
        ga = 
            new GeneticAlgorithm<>(gtf, ff, Optimize.MAXIMUM);
 
        ga.setStatisticsCalculator(
            new NumberStatistics.Calculator<BitGene, Integer>()
        );
        ga.setPopulationSize(populationSize);
        ga.setSelectors(
            new RouletteWheelSelector<BitGene, Integer>()
        );
        ga.setAlterers(
            new Mutator<BitGene>(0.05),//(0.55),
            new SinglePointCrossover<BitGene>(0.75)//(0.06)
        );
        ga.setup();
        return ga;
    }
    
    /**
     * Ecriture d'un texte dans un fichier 
     * @param fileName
     * @param text
     */
    private static void toFile(String fileName, String text)
	{
		String path = fileName;
		try
		{
			FileWriter fw = new FileWriter(path, false);
			BufferedWriter output = new BufferedWriter(fw);
			output.write(text);
			output.flush();
			output.close();
			System.out.println("écriture du fichier " + fileName + " terminée");
		}
		catch(IOException ioe){
			System.out.print("Erreur : ");
			ioe.printStackTrace();
		}
	}
    
    private synchronized static String getHtmlCode(Genotype<BitGene> genotype) {
        List<Boolean> list = new ArrayList<Boolean>();
        for (BitGene gene : genotype.getChromosome()) {
            list.add(gene.getBit());
        }
        BasicEList<Boolean> eList = new BasicEList<Boolean> (list); 
      
        return GenAlgo.ui.getHtmlCode(eList);
    }
}


final class OneCounter
    implements Function<Genotype<BitGene>, Integer>
{
	/**
	 * Fonction de fitness utilisée par l'algo, englobe l'appel pour utiliser le modèle
	 */
    public synchronized Integer apply(Genotype<BitGene> genotype) {
        List<Boolean> list = new ArrayList<Boolean>();
        for (BitGene gene : genotype.getChromosome()) {
            list.add(gene.getBit());
        }
        BasicEList<Boolean> eList = new BasicEList<Boolean> (list); 
      
        return GenAlgo.ui.apply(eList);
    }
}
 