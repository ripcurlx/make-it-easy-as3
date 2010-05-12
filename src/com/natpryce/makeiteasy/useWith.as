package com.natpryce.makeiteasy {
public function useWith(...args):PropertyValue {
    var property:Property = args[0];
    if (args[1] is Maker) {
        return new PropertyValue(property, (args[1] as Maker).make());
    } else {
        return new PropertyValue(property, args[1]);
    }
}
}