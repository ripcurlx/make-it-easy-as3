package com.natpryce.makeiteasy {
public class PropertyValue {
    public var property:Property;
    public var value:*;

    public function PropertyValue(property:Property, value:*) {
        this.property = property;
        this.value = value;
    }
}
}