/**
 */
package UI.impl;

import UI.Element;
import UI.Layout;
import UI.UIPackage;

import java.util.Collection;

import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.common.notify.NotificationChain;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.eclipse.emf.ecore.util.EObjectContainmentWithInverseEList;
import org.eclipse.emf.ecore.util.InternalEList;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Layout</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * <ul>
 *   <li>{@link UI.impl.LayoutImpl#getName <em>Name</em>}</li>
 *   <li>{@link UI.impl.LayoutImpl#getElements <em>Elements</em>}</li>
 *   <li>{@link UI.impl.LayoutImpl#isVertical <em>Vertical</em>}</li>
 *   <li>{@link UI.impl.LayoutImpl#isLeft <em>Left</em>}</li>
 *   <li>{@link UI.impl.LayoutImpl#isRight <em>Right</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class LayoutImpl extends ElementImpl implements Layout {
	/**
	 * The default value of the '{@link #getName() <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getName()
	 * @generated
	 * @ordered
	 */
	protected static final String NAME_EDEFAULT = null;

	/**
	 * The cached value of the '{@link #getName() <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getName()
	 * @generated
	 * @ordered
	 */
	protected String name = NAME_EDEFAULT;

	/**
	 * The cached value of the '{@link #getElements() <em>Elements</em>}' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getElements()
	 * @generated
	 * @ordered
	 */
	protected EList<Element> elements;

	/**
	 * The default value of the '{@link #isVertical() <em>Vertical</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isVertical()
	 * @generated
	 * @ordered
	 */
	protected static final boolean VERTICAL_EDEFAULT = false;

	/**
	 * The cached value of the '{@link #isVertical() <em>Vertical</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isVertical()
	 * @generated
	 * @ordered
	 */
	protected boolean vertical = VERTICAL_EDEFAULT;

	/**
	 * The default value of the '{@link #isLeft() <em>Left</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isLeft()
	 * @generated
	 * @ordered
	 */
	protected static final boolean LEFT_EDEFAULT = false;

	/**
	 * The cached value of the '{@link #isLeft() <em>Left</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isLeft()
	 * @generated
	 * @ordered
	 */
	protected boolean left = LEFT_EDEFAULT;

	/**
	 * The default value of the '{@link #isRight() <em>Right</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isRight()
	 * @generated
	 * @ordered
	 */
	protected static final boolean RIGHT_EDEFAULT = false;

	/**
	 * The cached value of the '{@link #isRight() <em>Right</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isRight()
	 * @generated
	 * @ordered
	 */
	protected boolean right = RIGHT_EDEFAULT;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected LayoutImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return UIPackage.Literals.LAYOUT;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String getName() {
		return name;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setName(String newName) {
		String oldName = name;
		name = newName;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, UIPackage.LAYOUT__NAME, oldName, name));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<Element> getElements() {
		if (elements == null) {
			elements = new EObjectContainmentWithInverseEList<Element>(Element.class, this, UIPackage.LAYOUT__ELEMENTS, UIPackage.ELEMENT__LAYOUT);
		}
		return elements;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean isVertical() {
		return vertical;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setVertical(boolean newVertical) {
		boolean oldVertical = vertical;
		vertical = newVertical;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, UIPackage.LAYOUT__VERTICAL, oldVertical, vertical));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean isLeft() {
		return left;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setLeft(boolean newLeft) {
		boolean oldLeft = left;
		left = newLeft;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, UIPackage.LAYOUT__LEFT, oldLeft, left));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean isRight() {
		return right;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setRight(boolean newRight) {
		boolean oldRight = right;
		right = newRight;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, UIPackage.LAYOUT__RIGHT, oldRight, right));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public NotificationChain eInverseAdd(InternalEObject otherEnd, int featureID, NotificationChain msgs) {
		switch (featureID) {
			case UIPackage.LAYOUT__ELEMENTS:
				return ((InternalEList<InternalEObject>)(InternalEList<?>)getElements()).basicAdd(otherEnd, msgs);
		}
		return super.eInverseAdd(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs) {
		switch (featureID) {
			case UIPackage.LAYOUT__ELEMENTS:
				return ((InternalEList<?>)getElements()).basicRemove(otherEnd, msgs);
		}
		return super.eInverseRemove(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case UIPackage.LAYOUT__NAME:
				return getName();
			case UIPackage.LAYOUT__ELEMENTS:
				return getElements();
			case UIPackage.LAYOUT__VERTICAL:
				return isVertical();
			case UIPackage.LAYOUT__LEFT:
				return isLeft();
			case UIPackage.LAYOUT__RIGHT:
				return isRight();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case UIPackage.LAYOUT__NAME:
				setName((String)newValue);
				return;
			case UIPackage.LAYOUT__ELEMENTS:
				getElements().clear();
				getElements().addAll((Collection<? extends Element>)newValue);
				return;
			case UIPackage.LAYOUT__VERTICAL:
				setVertical((Boolean)newValue);
				return;
			case UIPackage.LAYOUT__LEFT:
				setLeft((Boolean)newValue);
				return;
			case UIPackage.LAYOUT__RIGHT:
				setRight((Boolean)newValue);
				return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
			case UIPackage.LAYOUT__NAME:
				setName(NAME_EDEFAULT);
				return;
			case UIPackage.LAYOUT__ELEMENTS:
				getElements().clear();
				return;
			case UIPackage.LAYOUT__VERTICAL:
				setVertical(VERTICAL_EDEFAULT);
				return;
			case UIPackage.LAYOUT__LEFT:
				setLeft(LEFT_EDEFAULT);
				return;
			case UIPackage.LAYOUT__RIGHT:
				setRight(RIGHT_EDEFAULT);
				return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
			case UIPackage.LAYOUT__NAME:
				return NAME_EDEFAULT == null ? name != null : !NAME_EDEFAULT.equals(name);
			case UIPackage.LAYOUT__ELEMENTS:
				return elements != null && !elements.isEmpty();
			case UIPackage.LAYOUT__VERTICAL:
				return vertical != VERTICAL_EDEFAULT;
			case UIPackage.LAYOUT__LEFT:
				return left != LEFT_EDEFAULT;
			case UIPackage.LAYOUT__RIGHT:
				return right != RIGHT_EDEFAULT;
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		if (eIsProxy()) return super.toString();

		StringBuffer result = new StringBuffer(super.toString());
		result.append(" (name: ");
		result.append(name);
		result.append(", vertical: ");
		result.append(vertical);
		result.append(", left: ");
		result.append(left);
		result.append(", right: ");
		result.append(right);
		result.append(')');
		return result.toString();
	}

} //LayoutImpl
