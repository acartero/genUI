/**
 */
package UI;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Input Box</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link UI.InputBox#getCapacity <em>Capacity</em>}</li>
 * </ul>
 * </p>
 *
 * @see UI.UIPackage#getInputBox()
 * @model
 * @generated
 */
public interface InputBox extends Widget {
	/**
	 * Returns the value of the '<em><b>Capacity</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Capacity</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Capacity</em>' attribute.
	 * @see #setCapacity(int)
	 * @see UI.UIPackage#getInputBox_Capacity()
	 * @model
	 * @generated
	 */
	int getCapacity();

	/**
	 * Sets the value of the '{@link UI.InputBox#getCapacity <em>Capacity</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Capacity</em>' attribute.
	 * @see #getCapacity()
	 * @generated
	 */
	void setCapacity(int value);

} // InputBox
