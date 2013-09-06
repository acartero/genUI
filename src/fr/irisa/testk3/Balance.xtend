package fr.irisa.testk3

import fr.inria.triskell.k3.Aspect

/*
 * L'aspect balance de la classe UI décrit le calcul de la balance.
 */

@Aspect(className=typeof(UI))
 class UIBalance { 
 	/**
 	 * Rend le score correspondant à la balance du modèle
 	 * @return score(double) compris entre 0 et 1
 	 */
 	def double computeBalance(){
 		var double centerX = _self.layout.width.doubleValue / 2
 		var double centerY = _self.layout.height.doubleValue /2
 		var double BMhorizontal = 0
 		var double BMvertical = 0
 		var double wL = 0
 		var double wR = 0
 		var double wT = 0
 		var double wB = 0
		for(i : 0 ..< _self.flatList.size){
			var e = _self.flatList.get(i)
 			if(e.visible){
 					var double h = e.height
 					var double w = e.width
 					var double x = e.posX
 					var double y = e.posY
 					h = h*_self.abs(centerX - x)
 					wL = wL+h
 					h =  h * _self.abs(centerX - (x + w))
 					wR = wR + h
 					w = w * _self.abs(centerY - y)
 					wT = wT + w
 					w = w * _self.abs(centerY - (y + h))
 					wB = wB + w  
 					/* 
 					wL = wL + h * _self.abs(centerX - x)
 					wR = wR + h * _self.abs(centerX - (x + w))
 					wT = wT + w * _self.abs(centerY - y)
 					wB = wB + w * _self.abs(centerY - (y + h))*/
				}
 		
 		}
 		
 		BMvertical = (wL-wR)/_self.max(_self.abs(wL), _self.abs(wR))
		BMhorizontal = (wT-wB)/_self.max(_self.abs(wT), _self.abs(wB))
 		
 		return 1-(_self.abs(BMvertical)+_self.abs(BMhorizontal))/2
 	
 	}
}