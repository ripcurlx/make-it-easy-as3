package com.natpryce.makeiteasy {

/**
 * The value of a property that is shared among all instances created by a Maker.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */

public class SharedPropertyValue implements PropertyValue{

    private var _property:Property;
    private var _value : *;

    public function SharedPropertyValue(property:Property, value:*) {
        _property = property;
        _value = value;
    }

    public function get property():Property {
        return _property;
    }

    public function get value():* {
        return _value;
    }
}
}