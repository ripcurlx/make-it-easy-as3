package com.natpryce.makeiteasy {
public interface PropertyLookup {
    function valueOf(property:Property, defaultValue:*):*;
}
}