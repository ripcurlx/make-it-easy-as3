package com.natpryce.makeiteasy {
import flash.utils.Dictionary;

/**
 * Makes objects of a given type with a specified initial state.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */
public class Maker implements PropertyLookup {
    private var instantiator:Instantiator;
    private var values:Dictionary;

    /**
     * Creates a Maker for objects of a given type with a given initial state.
     *
     * @param instantiator creates the new objects
     * @param propertyValues define the initial state of the new objects
     */
    public function Maker(...args) {

        var propertyValues:Array = args[1];

        if (args[0] is Instantiator) {
            this.instantiator = args[0];
            this.values = new Dictionary();
            setPropertyValues(propertyValues);

        } else if (args[1] is Maker) {
            var that:Maker = (args[0] as Maker);
            this.instantiator = that.instantiator;
            this.values = new Dictionary();
            setPropertyValues(that.values);
            setPropertyValues(propertyValues);
        }
    }

    private function setPropertyValues(propertyValues:Object):void {
        for each (var propertyValue:PropertyValue in propertyValues) {
            values[propertyValue.property] = propertyValue.value;
        }
    }

    /**
     * Makes a new object.
     *
     * The {@link com.natpryce.makeiteasy.MakeItEasy#make(Maker) MakeItEasy.make} method
     * is syntactic sugar to make calls to this method read more naturally in most
     * contexts.
     *
     * @return a new object
     */
    public function make():* {
        return instantiator.instantiate(this);
    }

    /**
     * Returns a new Maker for the same type of object and with the same initial state
     * except where overridden by the given <var>propertyValues</var>.
     *
     * @param propertyValues those initial properties of the new Make that will differ from this Maker
     * @return a new Maker
     */
    public function but(... propertyValues):Maker {
        return new Maker(this, propertyValues);
    }

    public function valueOf(property:Property, defaultValue:*):* {
        if (values[property] != null) {
            return values[property];
        }
        else {
            return defaultValue;
        }
    }
}
}