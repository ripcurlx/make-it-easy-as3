package com.natpryce.makeiteasy {
public class ThingMaker {
    public static function get MyThing() : Instantiator {
        return new Instantiator(function(lookup:PropertyLookup):*{
            return new ThingToMake(lookup.valueOf(MakeItEasyTest.name, "Nemo"), lookup.valueOf(MakeItEasyTest.age, 99));
        });
    }
}
}