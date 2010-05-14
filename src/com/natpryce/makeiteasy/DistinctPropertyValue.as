package com.natpryce.makeiteasy {

/**
 * The value of a property for which a distinct value instance is created
 * for each instance created by a Maker.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */

public class DistinctPropertyValue implements PropertyValue{
    private var _property:Property;
    private var valueMaker:Maker;

    public function DistinctPropertyValue(property : Property, valueMaker : Maker) {
        this._property = property;
        this.valueMaker = valueMaker;
    }

    public function get property() : Property {
        return _property;
    }

    public function get value():* {
        return valueMaker.make();
    }
}
}