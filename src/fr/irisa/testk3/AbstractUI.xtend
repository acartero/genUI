package fr.irisa.testk3

import fr.inria.triskell.k3.Aspect
import UI.Layout
import org.eclipse.emf.common.util.EList
import UI.Element

import static extension fr.irisa.testk3.AbstractElementAspect.*


import static extension fr.irisa.testk3.AbstractLayoutAspect.*
import static extension fr.irisa.testk3.AbstractWidgetAspect.*
import UI.Widget
import UI.impl.LayoutImpl
/*
 * L'aspect abstrait permet de calculer la taille de la liste de booléens nécessaire à son initialisation
 * et permet l'initialisation via cette liste.
 */

@Aspect(className=typeof(Element))
 class AbstractElementAspect { 
 	/**
 	 * Initialise le modèle abstrait à partir d'une liste de booléens consommée au fur et à mesure.
 	 * Simule une méthode abstraite devant être surchargée.
 	 * @param list 	liste de booléens représentant le modèle abstrait.
 	 */
	def void initAbstract(EList<Boolean> list) {
		if (_self.class.simpleName == LayoutImpl.simpleName) 
			(_self as Layout).initAbstract(list) 
		else 
			(_self as Widget).initAbstract(list)
	}
	/**
	 * Retourne le nombre de booléens nécessaires pour décrire le modèle abstrait.
	 * Simule une méthode abstraite devant être surchargée.
	 * @return nombre(int) de booléens nécessaires pour décrire le modèle abstrait.
	 */
	def int genomeSize() {
		if (_self.class.simpleName == LayoutImpl.simpleName) 
			return (_self as Layout).genomeSize() 
		else 
			return(_self as Widget).genomeSize()
	}
} 



@Aspect(className=typeof(Layout))
 class AbstractLayoutAspect { // Go to the next state
 	/**
 	 * Initialise le modèle abstrait à partir d'une liste de booléens consommée au fur et à mesure.
 	 * Un layout consomme trois booléens pour être décrit.
 	 * @param list 	liste de booléens représentant le modèle abstrait.
 	 */
	def void initAbstract(EList<Boolean> list) {
		_self.vertical = list.get(0)
		list.remove(0)
		_self.left = list.get(0)
		list.remove(0)
		_self.right = list.get(0)
		list.remove(0)
		_self.elements.forEach[e|e.initAbstract(list)]
	}
	/**
	 * Retourne le nombre de booléens nécessaires pour décrire le modèle abstrait.
	 * Un layout nécessite trois booléens pour être décrit.
	 * @return nombre(int) de booléens nécessaires pour décrire le modèle abstrait.
	 */
	def int genomeSize() {
		var res = 3
		for(i : 0 ..< _self.elements.size)
		{
			res = res + _self.elements.get(i).genomeSize
		}
		return res
	}
} 
@Aspect(className=typeof(Widget))
 class AbstractWidgetAspect { // Go to the next state
 	/**
 	 * Initialise le modèle abstrait à partir d'une liste de booléens consommée au fur et à mesure.
 	 * Un widget n'a pas de paramètres à décrire par un booléen, cette méthode ne fait donc rien.
 	 * @param list 	liste de booléens représentant le modèle abstrait.
 	 */
	def void initAbstract(EList<Boolean> list) {
	}
	/**
	 * Retourne le nombre de booléens nécessaires pour décrire le modèle abstrait.
	 * Un widget ne nécessite pas de booléen pour être décrit.
	 * @return nombre(int) de booléens nécessaires pour décrire le modèle abstrait.
	 */
	def int genomeSize() {
		return 0
	}
} 