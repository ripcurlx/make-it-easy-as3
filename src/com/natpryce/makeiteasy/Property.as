package com.natpryce.makeiteasy {

/**
 * An opaque "handle" that represents a property of some type of object.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */
public class Property {

    public static function newProperty():Property {
        return new Property();
    }
}
}