package com.natpryce.makeiteasy {
public function a(instantiator:Instantiator, ... propertyProviders):Maker {
    return new Maker(instantiator, propertyProviders);
}
}