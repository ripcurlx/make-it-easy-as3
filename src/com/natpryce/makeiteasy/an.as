package com.natpryce.makeiteasy {

/**
 * Syntactic sugar for using Make It Easy test-data builders.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */
public function an(instantiator:Instantiator, ... propertyProviders):Maker{
    return new Maker(instantiator, propertyProviders);
}
}