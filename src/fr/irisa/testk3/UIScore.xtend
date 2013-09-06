package fr.irisa.testk3

import fr.inria.triskell.k3.Aspect
import org.eclipse.emf.common.util.EList

import static extension fr.irisa.testk3.AbstractElementAspect.*
import static extension fr.irisa.testk3.ConcreteElementAspect.*
import static extension fr.irisa.testk3.LayoutCoherenceAspect.*
import static extension fr.irisa.testk3.UIBalance.*

/*
 * L'aspect score de la classe UI décrit le calcul du score.
 */

@Aspect(className=typeof(UI))
 class UIScore { 
 	/**
 	 * Retourne le score combinant les différentes fitness.
 	 * @return score(int).
 	 */
 	def int score (){
 		/* 
 		var double windowScore = 0
 		windowScore = (_self.layout.height - _self.layout.width)
 		windowScore = windowScore / _self.layout.height
 		*/
 		var balance = _self.computeBalance
 		var density = _self.computeDensity
 		var coherence = _self.computeCoherence
 		var proportion = _self.computeProportion
 		
 		//*
 		density = density * density
 		return (balance * density * proportion *coherence *10000000).intValue//*/
		/*coherence = coherence * coherence
 		density = density * density
 		return (balance * density * coherence * proportion *100000000).intValue//*/
 		
 		
 		/*var balance = _self.computeBalance
 		var density = _self.computeDensity
 		var coherence = _self.computeCoherence
 		var proportion = _self.computeProportion
 		return ((balance+density+coherence)*proportion*100).intValue*/
 		
 		/*(((_self.computeBalance()*_self.computeBalance()*100) 
 			+ (_self.computeDensity()*_self.computeDensity()*100))
 			/ _self.abs(1+windowScore)
 			).intValue*/
 	}
 	
 	/**
 	 * Fitness évitant les solutions trop linéaires.
 	 * @return score(double).
 	 */
 	def double computeProportion(){
 		var double width = _self.layout.width
 		var double height = _self.layout.height
 		var double res
 		

 		/*if (width > height){
 			res = (1.0-(width-height)/width)
 		}
 		else{
 			res = (1.0-(height-width)/height)
 		}//*/
 		//* 
 		var minRatio = 3
 		if (width > height){
 			res = minRatio*(1-(width-height)/width)
 		}
 		else{
 			res = minRatio*(1-(height-width)/height)
 		}
 		if(res > 1)
 			res = 1//*/
 		return res
 	}
 	
 	/**
 	 * Retourne la cohérence de l'UI.
 	 * @return score(double).
 	 */
 	def double computeCoherence(){
 		return _self.layout.computeCoherence
 	}
 	/**
 	 * Calcule la densité de l'UI.
 	 * @return score(double).
 	 */
 	def double computeDensity (){
 		var res = 0.0
		for(i : 0 ..< _self.flatList.size){
			var e = _self.flatList.get(i)
 			if(e.visible)
				res = res + e.width * e.height
		}
 		res = res / (_self.layout.width * _self.layout.height)
 		return res
 	}
}