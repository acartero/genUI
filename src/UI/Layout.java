/**
 */
package UI;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Layout</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link UI.Layout#getName <em>Name</em>}</li>
 *   <li>{@link UI.Layout#getElements <em>Elements</em>}</li>
 *   <li>{@link UI.Layout#isVertical <em>Vertical</em>}</li>
 *   <li>{@link UI.Layout#isLeft <em>Left</em>}</li>
 *   <li>{@link UI.Layout#isRight <em>Right</em>}</li>
 * </ul>
 * </p>
 *
 * @see UI.UIPackage#getLayout()
 * @model
 * @generated
 */
public interface Layout extends Element {
	/**
	 * Returns the value of the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Name</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Name</em>' attribute.
	 * @see #setName(String)
	 * @see UI.UIPackage#getLayout_Name()
	 * @model
	 * @generated
	 */
	String getName();

	/**
	 * Sets the value of the '{@link UI.Layout#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 * @generated
	 */
	void setName(String value);

	/**
	 * Returns the value of the '<em><b>Elements</b></em>' containment reference list.
	 * The list contents are of type {@link UI.Element}.
	 * It is bidirectional and its opposite is '{@link UI.Element#getLayout <em>Layout</em>}'.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Elements</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Elements</em>' containment reference list.
	 * @see UI.UIPackage#getLayout_Elements()
	 * @see UI.Element#getLayout
	 * @model opposite="layout" containment="true"
	 * @generated
	 */
	EList<Element> getElements();

	/**
	 * Returns the value of the '<em><b>Vertical</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Vertical</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Vertical</em>' attribute.
	 * @see #setVertical(boolean)
	 * @see UI.UIPackage#getLayout_Vertical()
	 * @model
	 * @generated
	 */
	boolean isVertical();

	/**
	 * Sets the value of the '{@link UI.Layout#isVertical <em>Vertical</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Vertical</em>' attribute.
	 * @see #isVertical()
	 * @generated
	 */
	void setVertical(boolean value);

	/**
	 * Returns the value of the '<em><b>Left</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Left</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Left</em>' attribute.
	 * @see #setLeft(boolean)
	 * @see UI.UIPackage#getLayout_Left()
	 * @model
	 * @generated
	 */
	boolean isLeft();

	/**
	 * Sets the value of the '{@link UI.Layout#isLeft <em>Left</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Left</em>' attribute.
	 * @see #isLeft()
	 * @generated
	 */
	void setLeft(boolean value);

	/**
	 * Returns the value of the '<em><b>Right</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Right</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Right</em>' attribute.
	 * @see #setRight(boolean)
	 * @see UI.UIPackage#getLayout_Right()
	 * @model
	 * @generated
	 */
	boolean isRight();

	/**
	 * Sets the value of the '{@link UI.Layout#isRight <em>Right</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Right</em>' attribute.
	 * @see #isRight()
	 * @generated
	 */
	void setRight(boolean value);

} // Layout
