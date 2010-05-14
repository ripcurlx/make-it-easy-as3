package com.natpryce.makeiteasy {

/**
 * Syntactic sugar for using Make It Easy test-data builders.
 * 
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */
public function withA(...args):PropertyValue {

    var property:Property;
    var valueMaker : Maker;

    if( args[0] is Property) {
        property = args[0];

        if(args[1] is Maker) {
            valueMaker = args[1];
            return new DistinctPropertyValue(property, valueMaker);
        } else {
            return new SharedPropertyValue(property, args[1]);
        }

    } else {
        property = args[1];

        if(args[0] is Maker) {
            valueMaker = args[0];
            return new DistinctPropertyValue(property, valueMaker);
        } else {
            return new SharedPropertyValue(property, args[0]);
        }

    }
}
}