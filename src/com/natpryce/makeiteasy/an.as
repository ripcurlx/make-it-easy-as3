package com.natpryce.makeiteasy {

public function an(instantiator:Instantiator, ... propertyProviders):Maker{
    return new Maker(instantiator, propertyProviders);
}
}