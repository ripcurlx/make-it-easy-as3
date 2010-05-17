package example.fruit {
public class Banana extends Fruit {

    public var _curve : Number;

    public function Banana(curve : Number) {
        _curve = curve;
    }

    public function get curve() : Number {
        return _curve;
    }
}
}