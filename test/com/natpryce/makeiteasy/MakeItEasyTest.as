package com.natpryce.makeiteasy {
import org.hamcrest.assertThat;
import org.hamcrest.core.isA;
import org.hamcrest.object.equalTo;

public class MakeItEasyTest {

    public static var name:Property = Property.newProperty();
    public static var age:Property = Property.newProperty();
    public static var thing:Property = Property.newProperty();

    [Test] public function
    usesDefaultPropertyValuesIfNoPropertiesSpecified():void {
        var madeThing : ThingToMake = make(a(ThingMaker.MyThing));

        assertThat(madeThing.name, equalTo("Nemo"));
        assertThat(madeThing.age, equalTo(99));
        assertThat(false, isA(false));
    }
    
    [Test] public function
    overridesDefaultValuesWithExplicitProperties():void {
        var madeThing : ThingToMake = make(a(ThingMaker.MyThing, useWith(name, "Bob"), useWith(age, 10)));

        assertThat(madeThing.name, equalTo("Bob"));
        assertThat(madeThing.age, equalTo(10));

        var differentName:ThingToMake = make(a(ThingMaker.MyThing, useWith(name, "Bill")));
        assertThat(differentName.name, equalTo("Bill"));

    }

    [Test] public function
    canUseMakersToInitialisePropertyValues():void {
        var container : ThingContainer = make(a(ThingContainerMaker.MyContainer, useWith(thing, a(ThingMaker.MyThing, useWith(name, "foo")))));

        assertThat(container.thing.name, equalTo("foo"));
    }
}
}
