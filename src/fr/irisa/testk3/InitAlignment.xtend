package fr.irisa.testk3

import UI.Layout
import UI.Element
import UI.impl.LayoutImpl
import UI.Widget
import fr.inria.triskell.k3.Aspect
import static extension fr.irisa.testk3.ElementAlignmentAspect.*
import static extension fr.irisa.testk3.WidgetAlignmentAspect.*
import static extension fr.irisa.testk3.LayoutAlignmentAspect.*
import static extension fr.irisa.testk3.ConcreteLayoutAspect.*

/*
 * L'aspect InitAlignement gère l'alignement des éléments pour le passage au modèle concret
 */

@Aspect(className=typeof(Element))
 class ElementAlignmentAspect {
 	/**
 	 * Fait prendre l'espace maximum disponible à l'élément.
 	 * Simule une méthode abstraite devant être surchargée.
 	 */
	def void takeAll(){
		if (_self.layout.vertical)
			_self.width = _self.layout.width - 2*_self.layout.marginX
		else
			_self.height = _self.layout.height - 2*_self.layout.marginY
	} 
 	/**
 	 * Positionne l'élément à droite/en bas.
 	 * Simule une méthode abstraite devant être surchargée.
 	 */
	def void moveOpposite(){
		if (_self.class.simpleName == LayoutImpl.simpleName) {
			(_self as Layout).moveOpposite() 
		}
		else {
			(_self as Widget).moveOpposite()
		}
	} 
 	/**
 	 * Centre l'élément.
 	 * Simule une méthode abstraite devant être surchargée.
 	 */
	def void center(){
		if (_self.class.simpleName == LayoutImpl.simpleName) {
			(_self as Layout).center() 
		}
		else {
			(_self as Widget).center()
		}
	}
 	/**
 	 * Déplace l'élément.
 	 * Simule une méthode abstraite devant être surchargée.
 	 * @param x déplacement horizontal
 	 * @param y déplacement vertical
 	 */
	def void move(int x, int y){
		if (_self.class.simpleName == LayoutImpl.simpleName) {
			(_self as Layout).move(x,y) 
		}
		else {
			(_self as Widget).move(x,y)
		}
	}
 }
 	
@Aspect(className=typeof(Layout))
 class LayoutAlignmentAspect {
 	/**
 	 * Choisit l'opération à effectuer en fonction des attributs left et right
 	 */
	def void initAlignment(){
		if (_self.left && _self.right)
			_self.initFull
		else if (_self.left && !_self.right)
			_self.stayTheSame
		else if (!_self.left && _self.right)
			_self.initMove
		else 
			_self.initCentered
	}
	/**
	 * Fait prendre la place maximale aux éléments contenus dans le layout
	 */
	def void initFull(){
		_self.elements.forEach[e|e.takeAll]
	} 
	/**
	 * Position par défaut, ne fait rien
	 */
	def void stayTheSame(){}
	/**
	 * Aligne les éléments contenus dans le layout à droite/en bas
	 */
	def void initMove(){
			_self.elements.forEach[e|e.moveOpposite]
	} 
	/**
	 * Contre les éléments contenus dans le layout
	 */
	def void initCentered(){
		_self.elements.forEach[e|e.center]
	}
	/**
	 * Déplace le layout en bas/à droite
	 */
	def void moveOpposite(){
		if (_self.layout.vertical){
			_self.posX = _self.posX + (_self.layout.width - _self.width)
			_self.elements.forEach[e|e.move(_self.layout.width - _self.width, 0)]
		}
		else{
			_self.posY = _self.posY + (_self.layout.height - _self.height)
			_self.elements.forEach[e|e.move(0, _self.layout.height - _self.height)]
		}
	}
	/**
	 * Centre le layout
	 */
	def void center(){
		if (_self.layout.vertical){
			_self.posX = _self.posX + (_self.layout.width - _self.width - 2*_self.layout.marginX) / 2
			_self.elements.forEach[e|e.move((_self.layout.width - _self.width - 2*_self.layout.marginX)/2, 0)]
		}
		else{
			_self.posY = _self.posY + (_self.layout.height - _self.height - 2*_self.layout.marginY) / 2
			_self.elements.forEach[e|e.move(0, (_self.layout.height - _self.height - 2*_self.layout.marginY)/2)]
		}
	}
	/**
	 * Déplace le layout
	 * @param x déplacement horizontal
	 * @param y déplacement vertical
	 */
	def void move(int x, int y){
		_self.posX = _self.posX + x
		_self.posY = _self.posY + y
		_self.elements.forEach[e|e.move(x,y)]
	}
 }
 
@Aspect(className=typeof(Widget))
 class WidgetAlignmentAspect {
 	
 	/**
 	 * Déplace le widget à droite/en bas
 	 */
	def void moveOpposite(){
		if (_self.layout.vertical)
			_self.posX = _self.posX + (_self.layout.width - _self.width) - 2*_self.layout.marginX
		else
			_self.posY = _self.posY + (_self.layout.height - _self.height) - 2*_self.layout.marginY
	}
	/**
	 * Centre le widget
	 */
	def void center(){
		if (_self.layout.vertical)
			_self.posX = _self.posX + (_self.layout.width - _self.width - 2*_self.layout.marginX) / 2
		else
			_self.posY = _self.posY + (_self.layout.height - _self.height - 2*_self.layout.marginY) / 2
		
	}
	/**
	 * Déplace le widget
	 * @param x déplacement horizontal
	 * @parma y déplacement vertical
	 */
	def void move(int x, int y){
		_self.posX = _self.posX + x
		_self.posY = _self.posY + y
	}
 }