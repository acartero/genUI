package fr.irisa.testk3

import fr.inria.triskell.k3.Aspect
import UI.Layout
import UI.impl.LayoutImpl


/*
 * L'aspect coherence de la classe UI décrit le calcul de la cohérence.
 */


@Aspect(className=typeof(Layout))
 class LayoutCoherenceAspect {
 	/**
 	 * Rend le score correspondant à la cohérence du modèle
 	 * @return score(double) compris entre 0 et 1
 	 */
 	def double computeCoherence(){
 		var double score = 0.0
 		var int size = _self.elements.size
 		var int siblings = 0
		for(i : 0 ..< size){
			var sibling = _self.elements.get(i)
			if (sibling.class.simpleName == LayoutImpl.simpleName)
			{
				var double localScore = 0.0
				siblings = siblings + 1
				if ((sibling as Layout).vertical == _self.vertical)
					localScore = localScore + 1.0/6.0
				if ((sibling as Layout).left == _self.left)
					localScore = localScore + 1.0/6.0
				if ((sibling as Layout).right == _self.right)
					localScore = localScore + 1.0/6.0
				localScore = localScore + (sibling as Layout).computeCoherence/2
				score = score + localScore
			}
		}
		if (siblings != 0)
 			score = score / (siblings)
 		else 
 			score = 1
 		return score
 	}
 }