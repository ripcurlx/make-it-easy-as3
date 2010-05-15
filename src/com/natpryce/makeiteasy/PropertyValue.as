package com.natpryce.makeiteasy {

/**
 * The value of a property.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */
public interface PropertyValue {

    /**
     * The property
     */
    function get property() : Property;

    /**
     * The property's value
     */
    function get value() : *;

}
}