package com.natpryce.makeiteasy {
public function listOf(... propertyProviders):Array {
    var makerList:Array = new Array();
    for each (var maker:Maker in propertyProviders) {
        makerList.push(maker.make());
    }
    return makerList;
}
}