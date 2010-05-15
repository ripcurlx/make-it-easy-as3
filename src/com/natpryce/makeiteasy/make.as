package com.natpryce.makeiteasy {

/**
 * Syntactic sugar for using Make It Easy test-data builders.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */
public function make(maker : Maker) : * {
    return maker.make();
}
}