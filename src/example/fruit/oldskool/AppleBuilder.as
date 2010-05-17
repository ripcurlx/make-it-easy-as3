package example.fruit.oldskool {
import example.fruit.Apple;

public class AppleBuilder implements Builder {

    private var ripeness : Number = 0.0;
    private var leaves : int = 1;

    public static function anApple() : AppleBuilder {
        return new AppleBuilder();
    }

    public function build() : * {
        var apple : Apple = new Apple(leaves);
        apple.ripen(ripeness);

        return apple;
    }

    public function withRipeness(ripeness : Number) : AppleBuilder {
        this.ripeness = ripeness;
        return this;
    }

    public function withLeaves(leaves : int) : AppleBuilder {
        this.leaves = leaves;
        return this;
    }

    public function but() : AppleBuilder {
        return new AppleBuilder()
                .withRipeness(ripeness)
                .withLeaves(leaves);
    }
}
}