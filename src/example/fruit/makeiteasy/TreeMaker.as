package example.fruit.makeiteasy {
import com.natpryce.makeiteasy.Instantiator;
import com.natpryce.makeiteasy.Property;
import com.natpryce.makeiteasy.PropertyLookup;

import example.fruit.Tree;

public class TreeMaker {

    public static var fruit : Property = Property.newProperty();

    public static function get MyTree() : Instantiator {
        return new Instantiator(function(lookup : PropertyLookup) : * {
            return new Tree(lookup.valueOf(fruit, []));
        });
    }
}
}