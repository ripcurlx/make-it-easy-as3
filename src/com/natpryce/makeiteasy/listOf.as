package com.natpryce.makeiteasy {

/**
 * Syntactic sugar for using Make It Easy test-data builders.
 *
 * @author Christoph Atteneder (original java implementation by Nat Pryce)
 */
public function listOf(... propertyProviders):Array {
    var makerList:Array = new Array();
    for each (var maker:Maker in propertyProviders) {
        makerList.push(maker.make());
    }
    return makerList;
}
}