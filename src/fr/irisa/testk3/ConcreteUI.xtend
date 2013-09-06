package fr.irisa.testk3

import UI.Button
import UI.Element
import UI.InputBox
import UI.Label
import UI.Layout
import UI.Widget
import UI.impl.ButtonImpl
import UI.impl.InputBoxImpl
import UI.impl.LabelImpl
import UI.impl.LayoutImpl
import fr.inria.triskell.k3.Aspect

import static extension fr.irisa.testk3.ConcreteButtonAspect.*
import static extension fr.irisa.testk3.ConcreteElementAspect.*
import static extension fr.irisa.testk3.ConcreteInputBoxAspect.*
import static extension fr.irisa.testk3.ConcreteLabelAspect.*
import static extension fr.irisa.testk3.ConcreteLayoutAspect.*
import static extension fr.irisa.testk3.ConcreteWidgetAspect.*
import static extension fr.irisa.testk3.LayoutAlignmentAspect.*

/*
 * L'aspect concret permet de passer du modèle abstrait au modèle concret
 */


@Aspect(className=typeof(Element))
 class ConcreteElementAspect { 
 	/**
 	 * Initialise le modèle concret à partir du modèle abstrait.
 	 * Simule une méthode abstraite devant être surchargée.
 	 */
	def void initConcrete() {
		if (_self.class.simpleName == LayoutImpl.simpleName) {
			(_self as Layout).initConcrete() 
		}
		else {
			(_self as Widget).initConcrete()
		}
	}
 	 
	/*
	 * Les méthodes à suivre peuvent être nécessaires en cas d'héritage/surcharge, mais ne sont pas utilisée pour le moment
	 */
	 /*
	def int computeWidth() {
		if (_self.class.simpleName == LayoutImpl.simpleName) 
			return (_self as Layout).computeWidth() 
		else 
			return(_self as Widget).computeWidth()
	}
	def int computeHeight() {
		if (_self.class.simpleName == LayoutImpl.simpleName) 
			return (_self as Layout).computeHeight() 
		else 
			return(_self as Widget).computeHeight()
	}
	def int computePosX() {
		if (_self.class.simpleName == LayoutImpl.simpleName) 
			return (_self as Layout).computePosX() 
		else 
			return(_self as Widget).computePosX()
	}
	def int computePosY() {
		if (_self.class.simpleName == LayoutImpl.simpleName) 
			return (_self as Layout).computePosY() 
		else 
			return(_self as Widget).computePosY()
	}
	
	def void computeAlignment() {
		if (_self.class.simpleName == LayoutImpl.simpleName) 
			(_self as Layout).computeAlignment() 
		else 
			(_self as Widget).computeAlignment()
	}*/
} 



@Aspect(className=typeof(Layout))
 class ConcreteLayoutAspect { // Go to the next state
 	int innerMargin = 2
 	int marginX = 2
 	int marginY = 2
 	
 	/**
 	 * Initialise le modèle concret.
 	 */
	def void initConcrete() {
		_self.visible = false
		
		_self.posX = _self.computePosX()
		_self.posY = _self.computePosY()
		_self.elements.forEach[e|e.initConcrete()]
		_self.width = _self.computeWidth()
		_self.height = _self.computeHeight()
		
		_self.initAlignment() 
	}
	
 	/**
 	 * Appelé par un élément enfant pour lui transmettre ses coordonnées horizontales.
 	 * @param e élément appelant.
 	 * @return positionX(int) de l'élément appelant.
 	 */
	def int elemX(Element e) {
		if (_self.vertical)
			return _self.computePosX() + _self.marginX
		else
		{
			var res = _self.computePosX() + _self.marginX
			for(i : 0 ..< _self.elements.size){
				if (e != _self.elements.get(i))
				{
					res = res + _self.elements.get(i).width + _self.innerMargin
				}
				else{
					
					return res
				}
			}
		}
		return 0
	}
	
 	/**
 	 * Appelé par un élément enfant pour lui transmettre ses coordonnées verticales.
 	 * @param e élément appelant.
 	 * @return positionY(int) de l'élément appelant.
 	 */
	def int elemY(Element e) {
		if (!_self.vertical)
			return _self.computePosY() + _self.marginY
		else
		{
			var res = _self.computePosY() + _self.marginY
			for(i : 0 ..< _self.elements.size){
				if (e != _self.elements.get(i))
					res = res + _self.elements.get(i).height + _self.innerMargin
				else
					return res
			}
		}
		return 0
	}
	/**
	 * Calcule la largeur du layout.
	 * @return largeur(int) du layout.
	 */
	def int computeWidth() {
		if (_self.vertical)
		{
			var max = 0
			for(i : 0 ..< _self.elements.size){
				if (_self.elements.get(i).width > max)
					max = _self.elements.get(i).width
			}
			return max + 2 * _self.marginX
		}
		else{
			var res = 2 * _self.marginX
			for(i : 0 ..< _self.elements.size){
				res = res + _self.elements.get(i).width + _self.innerMargin
			}
			if (_self.elements.size > 0)
				return res - _self.innerMargin
			else
				return res
		}
	}
	
	/**
	 * Calcule la hauteur du layout.
	 * @return hauteur(int) du layout.
	 */
	def int computeHeight() {
		if (!_self.vertical)
		{
			var max = 0
			for(i : 0 ..< _self.elements.size){
				if (_self.elements.get(i).height > max)
					max = _self.elements.get(i).height
			}
			return max + 2 * _self.marginY
		}
		else{
			var res = 2 * _self.marginY
			for(i : 0 ..< _self.elements.size){
				res = res + _self.elements.get(i).height + _self.innerMargin
			}
			if (_self.elements.size > 0)
				return res - _self.innerMargin
			else
				return res
		}
	}
	/**
	 * Calcule la position horizontale du layout.
	 * @return positionX(int) du layout.
	 */
	def int computePosX() {
		if (_self.layout == null)
			return 0
		else
			return _self.layout.elemX(_self)
	}
	/**
	 * Calcule la position verticale du layout.
	 * @return positionY(int) du layout.
	 */
	def int computePosY() {
		if (_self.layout == null)
			return 0
		else
			return _self.layout.elemY(_self)
	}
} 

@Aspect(className=typeof(Widget))
 class ConcreteWidgetAspect { // Go to the next state
 	int charHeight = 20
 	double charWidth = 2.5	
 	int innerMargin = 2
 	
	/**
	 * Initialise le modèle concret.
	 */
	def void initConcrete() {
		_self.visible = true
		_self.width = _self.computeWidth()
		_self.height = _self.computeHeight()
		_self.posX = _self.computePosX()
		_self.posY = _self.computePosY()
	}
	
	/**
	 * Calcule la largeur du widget.
	 * Simule une méthode abstraite devant être surchargée.
	 * @return largeur(int) du widget.
	 */
	def int computeWidth() {
		if (_self.class.simpleName == ButtonImpl.simpleName) 
			return (_self as Button).computeWidth()
		else if (_self.class.simpleName == LabelImpl.simpleName) 
			return (_self as Label).computeWidth()
		else if (_self.class.simpleName == InputBoxImpl.simpleName) 
			return (_self as InputBox).computeWidth()
		return 0
	}
	
	/**
	 * Calcule la hauteur du widget.
	 * @return largeur(int) du widget.
	 */
	def int computeHeight() {
		return _self.charHeight + 2 * _self.innerMargin
	}
	
	/**
	 * Calcule la position horizontale du widget.
	 * @return positionX(int) du widget.
	 */
	def int computePosX() {
		return _self.layout.elemX(_self)
	}
	
	/**
	 * Calcule la position verticale du widget.
	 * @return positionY(int) du widget.
	 */
	def int computePosY() {
		return _self.layout.elemY(_self)
	}
} 
@Aspect(className=typeof(Button))
 class ConcreteButtonAspect { 
	/**
	 * Calcule la largeur du bouton.
	 * @return largeur(int) du bouton.
	 */
	def int computeWidth() {
		return (_self.text.length * _self.charWidth * 2 * _self.innerMargin).intValue+15
	}
 }
@Aspect(className=typeof(Label))
 class ConcreteLabelAspect { 
	/**
	 * Calcule la largeur du label.
	 * @return largeur(int) du label.
	 */
	def int computeWidth() {
		return (_self.text.length * _self.charWidth * 2 * _self.innerMargin).intValue
	}
 }
@Aspect(className=typeof(InputBox))
 class ConcreteInputBoxAspect { 
	/**
	 * Calcule la largeur de la boite de saisie.
	 * @return largeur(int) de la boite de saisie.
	 */
	def int computeWidth() {
		return (_self.capacity * _self.charWidth * 2 * _self.innerMargin).intValue
	}
 }