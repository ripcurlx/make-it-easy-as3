package example.fruit.makeiteasy {
import com.natpryce.makeiteasy.Instantiator;
import com.natpryce.makeiteasy.Property;
import com.natpryce.makeiteasy.PropertyLookup;
import com.natpryce.makeiteasy.a;
import com.natpryce.makeiteasy.listOf;

import example.fruit.FruitBowl;

/**
 * An example of how to define builders for properties that are collections.
 */
public class FruitBowlMaker {
    public static var contents : Property = Property.newProperty();

    public static function get MyFruitBowl() : Instantiator {
        return new Instantiator(function(lookup : PropertyLookup) : * {
            return new FruitBowl(lookup.valueOf(contents, listOf(a(FruitMakers.MyApple), a(FruitMakers.MyBanana))));
        });
    }
}
}