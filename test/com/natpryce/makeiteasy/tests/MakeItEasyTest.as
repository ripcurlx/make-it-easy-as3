package com.natpryce.makeiteasy.tests {
import com.natpryce.makeiteasy.*;

import org.hamcrest.assertThat;
import org.hamcrest.core.isA;
import org.hamcrest.object.equalTo;

public class MakeItEasyTest {

    public var name:Property = Property.newProperty();
    public var age:Property = Property.newProperty();

    public function get Thing() : Instantiator {
        return new Instantiator(function(lookup:PropertyLookup):*{
            return new ThingToMake(lookup.valueOf(name, "Nemo"), lookup.valueOf(age, 99));
        });
    }

    [Test] public function
    usesDefaultPropertyValuesIfNoPropertiesSpecified():void {
        var madeThing : ThingToMake = make(a(Thing));

        assertThat(madeThing.name, equalTo("Nemo"));
        assertThat(madeThing.age, equalTo(99));
        assertThat(false, isA(false));
    }
    
    [Test] public function
    overridesDefaultValuesWithExplicitProperties():void {
        var madeThing : ThingToMake = make(a(Thing, withA(name, "Bob"), withA(age, 10)));

        assertThat(madeThing.name, equalTo("Bob"));
        assertThat(madeThing.age, equalTo(10));

        var differentName:ThingToMake = make(a(Thing, withA(name, "Bill")));
        assertThat(differentName.name, equalTo("Bill"));

    }

    public var thing:Property = Property.newProperty();

    public function get Container() : Instantiator {
        return new Instantiator(function(lookup:PropertyLookup):*{
            return new ThingContainer((lookup.valueOf(thing, make(a(Thing)))));
        });
    }

    [Test] public function
    canUseMakersToInitialisePropertyValues():void {
        var container : ThingContainer = make(a(Container, withA(thing, a(Thing, withA(name, "foo")))));

        assertThat(container.thing.name, equalTo("foo"));
    }
}
}

class ThingToMake {
    public var name : String;
    public var age : int;

    public function ThingToMake(name:String, age:int) {
        this.name = name;
        this.age = age;
    }

}

class ThingContainer {
    public var thing:ThingToMake;
    public function ThingContainer(thing:ThingToMake) {
        this.thing = thing;
    }
}
