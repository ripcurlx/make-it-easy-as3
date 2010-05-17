package example.fruit.makeiteasy {
import com.natpryce.makeiteasy.Instantiator;
import com.natpryce.makeiteasy.Property;
import com.natpryce.makeiteasy.PropertyLookup;
import com.natpryce.makeiteasy.an;
import com.natpryce.makeiteasy.make;

import example.fruit.AppleCart;

/**
 * An example of how to define builders for properties that are collections.
 */
public class AppleCartMaker {
    public static var apples : Property = Property.newProperty();

    public static function get MyAppleCart() : Instantiator {
        return new Instantiator(function(lookup : PropertyLookup) : * {
            return new AppleCart(lookup.valueOf(apples, [make(an(FruitMakers.MyApple))]));
        });
    }
}
}