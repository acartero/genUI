package fr.irisa.testk3

import UI.Element
import fr.inria.triskell.k3.Aspect
import UI.Layout
import UI.Widget

import static extension fr.irisa.testk3.LayoutTest.*
import static extension fr.irisa.testk3.WidgetTest.*
import static extension fr.irisa.testk3.ElementTest.*
import UI.impl.LayoutImpl
import UI.impl.WidgetImpl
import static extension fr.irisa.testk3.ConcreteElementAspect.*
import static extension fr.irisa.testk3.ElementTest.*

/*
 * Classe permettant d'effectuer des tests
 */




@Aspect(className=typeof(Element))
 class ElementTest { // Go to the next state
	def void test() {
		if (_self.class.simpleName == LayoutImpl.simpleName) (_self as Layout).test else (_self as Widget).test
		//(_self as Layout).test
	}
	
	def void testSurcharge(){
		println("element")
	}
} 

@Aspect(className=typeof(Layout))
 class LayoutTest { // Go to the next state
	def void test() {
		println("layout " + _self.name + ", vertical = "+ _self.vertical)
		println("   x:" + _self.posX + ", y:" + _self.posY + ", w:" + _self.width + ", h:" + _self.height)
		_self.elements.forEach[e|e.test()]
	}
	
	def void testSurcharge(){
		println("layout")
	}
}
 @Aspect(className=typeof(Widget))
 class WidgetTest { // Go to the next state
	def void test() {
		println("Widget")
		println("   x:" + _self.posX + ", y:" + _self.posY + ", w:" + _self.width + ", h:" + _self.height)
	}
} 

class MainTest{
	public def void run() {
		var ui = new UI
		ui.init("Wikipedia.xmi")
		
		ui.layout.initConcrete
		ui.layout.testSurcharge
		//println(ui.layout.htmlCode)
	}
	

	def static void main(String[] args) {
		//println('Hello Kermeta on top of Xtend!')
		var hello = new MainTest
		hello.run
	}
}

