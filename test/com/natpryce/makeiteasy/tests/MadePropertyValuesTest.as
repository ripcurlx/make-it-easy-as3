package com.natpryce.makeiteasy.tests {
import com.natpryce.makeiteasy.Instantiator;
import com.natpryce.makeiteasy.Maker;
import com.natpryce.makeiteasy.Property;
import com.natpryce.makeiteasy.PropertyLookup;
import com.natpryce.makeiteasy.a;
import com.natpryce.makeiteasy.an;
import com.natpryce.makeiteasy.make;
import com.natpryce.makeiteasy.withA;
import com.natpryce.makeiteasy.withAn;

import org.hamcrest.assertThat;
import org.hamcrest.object.equalTo;

public class MadePropertyValuesTest {

    public var name : Property = Property.newProperty();

    public function get CanChangeName() : Instantiator {
        return new Instantiator(function(lookup : PropertyLookup) : * {
            return new Identity(lookup.valueOf(name, "default-name"));
        });
    }

    public var identity : Property = Property.newProperty();

    public function get MyIdentified() : Instantiator {
        return new Instantiator(function(lookup : PropertyLookup) : * {
            return new Identified(lookup.valueOf(identity, new Identity("defaul-identity")));
        });
    }

    [Test]
    public function
            aDistinctPropertyValueInstanceIsUsedForEachMadeObjectWhenPropertyIsDefinedWithAMaker() : void {
        var anIdentified : Maker = an(MyIdentified, withAn(identity, a(CanChangeName, withA(name, "original-name"))));

        var x : Identified = make(anIdentified);
        var y : Identified = make(anIdentified);

        x.identity.name = "new-name";

        assertThat(y.identity.name, equalTo("original-name"));
    }
}
}

class Identity {
    public var name : String;

    public function Identity(name : String) {
        this.name = name;
    }
}

class Identified {
    public var identity : Identity;

    public function Identified(identity : Identity) {
        this.identity = identity;
    }
}