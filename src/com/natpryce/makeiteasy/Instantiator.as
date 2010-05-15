package com.natpryce.makeiteasy {

/**
 * Instantiates an object, with an initial state specified by some
 * given property values or defaults defined by the
 * instantiator function passed in the constructor of this class.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */
public class Instantiator {

    private var instantiator : Function;

    /**
     *
     * @param instantiator Instantiates an object, with an initial state specified by some given property values or defaults
     */
    public function Instantiator(instantiator : Function) {
        this.instantiator = instantiator;
    }

    /**
     * Instantiates a new object.
     *
     * @param lookup initialisation property values
     * @return the new object
     */
    public function instantiate(param : PropertyLookup) : * {
        return instantiator(param);
    }
}
}