package example.fruit.makeiteasy {
import com.natpryce.makeiteasy.Instantiator;
import com.natpryce.makeiteasy.Property;
import com.natpryce.makeiteasy.PropertyLookup;

import example.fruit.Apple;
import example.fruit.Banana;

public class FruitMakers {

    public static var ripeness : Property = Property.newProperty();
    public static var leaves : Property = Property.newProperty();
    public static var curve : Property = Property.newProperty();

    public static function get MyApple() : Instantiator {
        return new Instantiator(function(lookup : PropertyLookup) : * {
            var apple : Apple = new Apple(lookup.valueOf(leaves, 2));
            apple.ripen(lookup.valueOf(ripeness, 0.0));
            return apple;
        });
    }

    public static function get MyBanana() : Instantiator {
        return new Instantiator(function(lookup : PropertyLookup) : * {
            var banana : Banana = new Banana(lookup.valueOf(curve, 0.5));
            banana.ripen(lookup.valueOf(ripeness, 0.0));
            return banana;
        });
    }
}
}