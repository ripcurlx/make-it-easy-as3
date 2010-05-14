package com.natpryce.makeiteasy {

/**
 * Looks up property values.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */
public interface PropertyLookup {
    function valueOf(property:Property, defaultValue:*):*;
}
}