package example.fruit.oldskool {
import example.fruit.Banana;

public class BananaBuilder implements Builder {
    private var curve : Number = 0.0;
    private var ripeness : Number = 0.5;

    public static function aBanana() : BananaBuilder {
        return new BananaBuilder();
    }

    public function build() : * {
        var banana : Banana = new Banana(curve);
        banana.ripen(ripeness);
        return banana;
    }

    public function withRipeness(ripeness : Number) : BananaBuilder {
        this.ripeness = ripeness;
        return this;
    }

    public function withCurve(curve : Number) : BananaBuilder {
        this.curve = curve;
        return this;
    }

    public function but() : BananaBuilder {
        return new BananaBuilder()
                .withRipeness(ripeness)
                .withCurve(curve);
    }
}
}