A tiny framework that makes it easy to write Test Data Builders in ActionScript 3

ActionScript 3 version of the [make-it-easy Java library](http://code.google.com/p/make-it-easy/) by [Nat Pryce](http://www.natpryce.com/).

*Original text by Nat Pryce (AS3 adaption by Christoph Atteneder)*

Test Data Builders are described in the book Growing Object-Oriented Software, Guided by Tests by Steve Freeman and Nat Pryce. This library lets you write Test Data Builders with much less duplication and boilerplate code than the approach described in the book.

**Example**

Consider the following class hierarchy. This hierarchy illustrates a couple of complicating factors: there is an abstract base class and there is a property (Fruit.ripeness) that is not set via the constructor but by an operation of the Fruit class.

    public class Fruit {
        private var ripeness : Number = 0.0;

        public function ripen(amount : Number) : void {
            ripeness = Math.min(1.0, ripeness + amount);
        }

        public function isRipe() : Boolean {
            return ripeness == 1.0;
        }
    }

    public class Apple extends Fruit {

        private var leaves : uint;

        public function Apple(leaves : uint) {
            this.leaves = leaves;
        }

        public function numberOfLeaves() : uint {
            return leaves;
        }
    }

    public class Banana extends Fruit {

        public var _curve : Number;

        public function Banana(curve : Number) {
            _curve = curve;
        }

        public function get curve() : Number {
            return _curve;
        }
    }
You can define Test Data Builders for Apples and Bananas with Make It Easy as follows:

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
And use them like this:

    var appleWith2Leaves : Maker = a(FruitMakers.MyApple, withA(2, FruitMakers.leaves));
    var ripeApple : Maker = appleWith2Leaves.but(withA(FruitMakers.ripeness, 0.9));
    var unripeApple : Maker = appleWith2Leaves.but(withA(FruitMakers.ripeness, 0.125));

    var apple1 : Apple = make(ripeApple);
    var apple2 : Apple = make(unripeApple);

    var defaultBanana : Banana = make(a(FruitMakers.MyBanana));
    var straightBanana : Banana = make(a(FruitMakers.MyBanana, withA(FruitMakers.curve, 0.0)));
    var squishyBanana : Banana = make(a(FruitMakers.MyBanana, withA(FruitMakers.ripeness, 1.0)));
In contrast, doing so in the style documented in Growing Object-Oriented Software, Guided by Tests would look like this:

    public interface Builder {
        function build() : *;
    }

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
And be used like this:

    var appleWith2Leaves : AppleBuilder = AppleBuilder.anApple().withLeaves(2);
    var ripeApple : AppleBuilder = appleWith2Leaves.but().withRipeness(0.9);
    var unripeApple : AppleBuilder = appleWith2Leaves.but().withRipeness(0.125);

    var apple1 : Apple = ripeApple.build();
    var apple2 : Apple = unripeApple.build();

    var defaultBanana : BananaBuilder = BananaBuilder.aBanana().build();
As you can see, with Make It Easy you have to write a lot less duplicated and boilerplate code. What duplication there is - in the declaration of anonymous Instantiator classes, for example - can be automatically inserted and refactored by modern IDEs. (You could also factor out calls to Fruit.ripen to a private helper method, but I left them duplicated for clarity.)

The full code for this example is in the [Make It Easy Git repository](http://github.com/ripcurlx/make-it-easy-as3/tree/master/src/example/fruit/).