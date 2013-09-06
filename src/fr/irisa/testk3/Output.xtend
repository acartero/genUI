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

import static extension fr.irisa.testk3.OutputButtonAspect.*
import static extension fr.irisa.testk3.OutputElementAspect.*
import static extension fr.irisa.testk3.OutputInputBoxAspect.*
import static extension fr.irisa.testk3.OutputLabelAspect.*
import static extension fr.irisa.testk3.OutputLayoutAspect.*
import static extension fr.irisa.testk3.OutputWidgetAspect.*

/**
 * L'aspect Output permet de générer le code html correspondant au modèle concret
 */

@Aspect(className=typeof(Element))
 class OutputElementAspect { 
	static int id = 0;
	/**
	 * Génère un identifiant nécessaire au parseur html du navigateur
	 * @return id(int) identifiant
	 */
 	def static int getIdd(){
 		_self.id = _self.id + 1
 		return _self.id
 	}
 	
 	/**
 	 * Initialise l'entête et le bas de page du code html
 	 * @return codeHtml(string)
 	 */
	def String htmlCode() {
		var res = "<!DOCTYPE html><html><head><meta charset=\"utf-8\" /><title>Generated UI</title></head><body>\n"
		
		if (_self.class.simpleName == LayoutImpl.simpleName) 
			res = res + (_self as Layout).htmlCode
		else 
			res = res + (_self as Widget).htmlCode
		res = res + "</body></html>"
		return res
	}
} 

@Aspect(className=typeof(Layout))
 class OutputLayoutAspect { // Go to the next state	
 	/**
 	 * Rend le code html correspondant au layout
 	 * @return codeHtml(string)
 	 */
 	def String htmlCode() {
 		var res = "<text "
 		res = res + "id=\""+_self.id+"\""
 		res = res + "style=\"position:absolute;\n"
 		res = res + "top:"+_self.posY + "px;\n"
 		res = res + "left:"+_self.posX + "px;\n"
 		res = res + "width:"+_self.width + "px;\n"
 		res = res + "height:"+_self.height + "px;\n"
 		res = res + "border:1px solid black;\n"
 		res = res + "\">\n"
 		res = res + "</text>\n"
		for(i : 0 ..< _self.elements.size)
		{
			res = res + _self.elements.get(i).htmlCode()
		}
 		return res
	}
} 
@Aspect(className=typeof(Widget))
 class OutputWidgetAspect { // Go to the next state
 	/**
 	 * Rend le code html correspondant au widget
 	 * Simule une méthode abstraite devant être surchargée.
 	 * @return codeHtml(string)
 	 */
	def String htmlCode() {
		if (_self.class.simpleName == ButtonImpl.simpleName) 
			return (_self as Button).htmlCode()
		else if (_self.class.simpleName == LabelImpl.simpleName) 
			return (_self as Label).htmlCode()
		else if (_self.class.simpleName == InputBoxImpl.simpleName) 
			return (_self as InputBox).htmlCode()
		return ""
	}
} 
@Aspect(className=typeof(Button))
 class OutputButtonAspect { 
 	/**
 	 * Rend le code html correspondant au bouton
 	 * @return codeHtml(string)
 	 */
	def String htmlCode() {
		var res = "<button type=\"button\""
 		res = res + "id=\""+_self.id+"\""
 		res = res + "style=\"position:absolute;\n"
 		res = res + "font-size: 16px;\nfont-family: Lucida Console ;\npadding:0;\nline-height:16px;\n"
 		res = res + "top:"+ _self.posY + "px;\n"
 		res = res + "left:"+ _self.posX + "px;\n"
 		res = res + "width:"+_self.width + "px;\n"
 		res = res + "height:"+_self.height + "px;\n"
 		res = res + "\">\n"
 		res = res + _self.text
 		res = res + "</button>\n"
 		return res
	}
 }
@Aspect(className=typeof(Label))
 class OutputLabelAspect { 
 	/**
 	 * Rend le code html correspondant au label
 	 * @return codeHtml(string)
 	 */
	def String htmlCode() {
		var res = "<text "
 		res = res + "id=\""+_self.id+"\""
		res = res + "style=\"position:absolute;\n"
 		res = res + "font-size: 16px;\nfont-family: Lucida Console ;\npadding:0;\nline-height:16px;\n"
 		res = res + "top:"+ _self.posY + "px;\n"
 		res = res + "left:"+ _self.posX + "px;\n"
 		res = res + "width:"+_self.width + "px;\n"
 		res = res + "height:"+_self.height + "px;\n"
 		res = res + "\">\n"
 		res = res + _self.text
 		res = res + "</text>\n"
 		return res
	}
 }
@Aspect(className=typeof(InputBox))
 class OutputInputBoxAspect { 
 	/**
 	 * Rend le code html correspondant à la boite de saisie
 	 * @return codeHtml(string)
 	 */
	def String htmlCode() {
		var res = "<input type=\"text\" "
 		res = res + "id=\""+_self.id+"\""
 		res = res + "style=\"position:absolute;\n"
 		res = res + "font-size: 16px;\nfont-family: Lucida Console ;\npadding:0;\nline-height:16px;\n"
 		res = res + "top:"+ _self.posY + "px;\n"
 		res = res + "left:"+ _self.posX + "px;\n"
 		res = res + "width:"+_self.width + "px;\n"
 		res = res + "height:"+_self.height + "px;\n"
 		res = res + "\">\n"
 		res = res + "</input>\n"
 		return res
	}
 }