package com.natpryce.makeiteasy {
public class ThingContainerMaker {
    public static function get MyContainer() : Instantiator {
        return new Instantiator(function(lookup:PropertyLookup):*{
            return new ThingContainer((lookup.valueOf(MakeItEasyTest.thing, make(a(ThingMaker.MyThing)))));
        });
    }
}
}