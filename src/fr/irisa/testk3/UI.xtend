package fr.irisa.testk3

import UI.Element
import UI.Layout
import UI.UIPackage
import org.eclipse.emf.common.util.BasicEList
import org.eclipse.emf.common.util.EList
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl

import static extension fr.irisa.testk3.AbstractElementAspect.*
import static extension fr.irisa.testk3.ConcreteElementAspect.*
import static extension fr.irisa.testk3.LayoutFitnessAspect.*
import static extension fr.irisa.testk3.UIScore.*
import fr.inria.triskell.k3.Aspect

import static extension fr.irisa.testk3.OutputElementAspect.*

/*
 * La classe UI fait l'interface entre le modèle et l'algorithme génétique
 */

class UI {
 	public EList<Element> flatList = new BasicEList<Element>()
 	public Layout layout
 	/**
 	 * Charge un modèle xmi à partir du nom du fichier de sauvegarde
 	 * @param name nom du fichier de sauvegarde
 	 */
 	def void init(String name){
 		var fact = new XMIResourceFactoryImpl
		if (!EPackage.Registry.INSTANCE.containsKey(UIPackage.eNS_URI)) {
			EPackage.Registry.INSTANCE.put(UIPackage.eNS_URI, UIPackage.eINSTANCE);
		}
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("*", fact);

		var rs = new ResourceSetImpl()

		//var uri = URI.createURI(args.get(0));
		var uri = URI.createURI(name);
		var res = rs.getResource(uri, true);
		this.layout = res.contents.get(0) as Layout
 		this.layout.initFlatList(flatList)
 	}
 	
 	/**
 	 * Rend la taille de la liste de booléens qui représente le modèle
 	 * @return taille(int)
 	 */
 	def int size(){
 		return layout.genomeSize
 	}
 	
 	/**
 	 * Rend la valeur absolue d'un double (utilisé dans l'aspect balance)
 	 * @param d nombre en entrée
 	 * @param d(double) valeur absolue de l'entrée
 	 */
 	def abs (double d){
 		if (d<0)
 			return d * -1
 		else 
 			return d
 	}
 	/**
 	 * Rend le plus grand des deux nombres d'entrée (utilisé dans l'aspect balance)
 	 * @param a premier nombre en entrée
 	 * @param b deuxième nombre en entrée
 	 * @param max(double) plus grand des deux nombres
 	 */
 	def max (double a, double b){
 		if (a>b)
 			return a
 		else
 			return b
 	}
 	
 	/**
 	 * Crée le modèle abstrait puis concret à partir d'une liste de booléen puis retourne le score
 	 * @return score(int)
 	 */
 	def int apply(EList<Boolean> list){
		//println(list)
 		layout.initAbstract(list)
 		layout.initConcrete()
 		/* 
 		//affichage pour debug
		println ("res = " + _self.computeDensity)
		println ("res2 = " + _self.computeBalance) 
		println ("total = " + _self.score) 
 		//*/
		return score()
 	}
 	/**
 	 * Retourne le code html correspondant à une liste de booléens
 	 * @return codeHtml(string)
 	 */
 	def String getHtmlCode(EList<Boolean> list)
 	{
 		layout.initAbstract(list)
 		layout.initConcrete
		return layout.htmlCode
 	}
}
