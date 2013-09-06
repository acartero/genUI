package fr.irisa.testk3

import UI.Element
import UI.Layout
import UI.Widget
import UI.impl.LayoutImpl
import fr.inria.triskell.k3.Aspect
import org.eclipse.emf.common.util.EList

import static extension fr.irisa.testk3.ElementFitnessAspect.*
import static extension fr.irisa.testk3.LayoutFitnessAspect.*
import static extension fr.irisa.testk3.WidgetFitnessAspect.*

/*
 * L'aspect fitness initialise la liste "plate" des éléments du modèle nécessaire à l'évaluation
 */

@Aspect(className=typeof(Element))
 class ElementFitnessAspect { 
 	/**
 	 * Initialise la liste "plate".
 	 * Simule une méthode abstraite devant être surchargée.
 	 * @param flatList liste "plate" des éléments.
 	 */
	def void initFlatList(EList<Element> flatList){
		if (_self.class.simpleName == LayoutImpl.simpleName) 
			(_self as Layout).initFlatList(flatList) 
		else 
			(_self as Widget).initFlatList(flatList)
	}
} 



@Aspect(className=typeof(Layout))
 class LayoutFitnessAspect { // Go to the next state
 	/**
 	 * Initialise la liste "plate".
 	 * @param flatList liste "plate" des éléments.
 	 */
 	def void initFlatList(EList<Element> flatList){
 		flatList.add(_self)
 		_self.elements.forEach[e|e.initFlatList(flatList)]
 	}
}
@Aspect(className=typeof(Widget))
 class WidgetFitnessAspect { // Go to the next state
 	/**
 	 * Initialise la liste "plate".
 	 * @param flatList liste "plate" des éléments.
 	 */
 	def void initFlatList(EList<Element> flatList){
 		flatList.add(_self)
 	}
} 
