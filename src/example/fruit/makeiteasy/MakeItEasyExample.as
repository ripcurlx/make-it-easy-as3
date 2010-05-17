package example.fruit.makeiteasy {
import com.natpryce.makeiteasy.Maker;
import com.natpryce.makeiteasy.a;
import com.natpryce.makeiteasy.listOf;
import com.natpryce.makeiteasy.make;
import com.natpryce.makeiteasy.withA;

import example.fruit.Apple;
import example.fruit.AppleCart;
import example.fruit.Banana;
import example.fruit.FruitBowl;
import example.fruit.Tree;

public class MakeItEasyExample {
    public static function howToMakeSimpleObjects() : void {
        var appleWith2Leaves : Maker = a(FruitMakers.MyApple, withA(2, FruitMakers.leaves));
        var ripeApple : Maker = appleWith2Leaves.but(withA(FruitMakers.ripeness, 0.9));
        var unripeApple : Maker = appleWith2Leaves.but(withA(FruitMakers.ripeness, 0.125));

        var apple1 : Apple = make(ripeApple);
        var apple2 : Apple = make(unripeApple);

        var defaultBanana : Banana = make(a(FruitMakers.MyBanana));
        var straightBanana : Banana = make(a(FruitMakers.MyBanana, withA(FruitMakers.curve, 0.0)));
        var squishyBanana : Banana = make(a(FruitMakers.MyBanana, withA(FruitMakers.ripeness, 1.0)));
    }

    public static function howToMakeObjectsWithPropertiesThatAreCollections() : void {
        var cart : AppleCart = make(a(AppleCartMaker.MyAppleCart, withA(AppleCartMaker.apples, listOf(
                a(FruitMakers.MyApple, withA(FruitMakers.ripeness, 0.5)),
                a(FruitMakers.MyApple, withA(FruitMakers.ripeness, 0.35))
                ))));

        var bowl : FruitBowl = make(a(FruitBowlMaker.MyFruitBowl, withA(FruitBowlMaker.contents, listOf(
                a(FruitMakers.MyApple, withA(2, FruitMakers.leaves)),
                a(FruitMakers.MyApple, withA(3, FruitMakers.leaves)),
                a(FruitMakers.MyBanana, withA(FruitMakers.ripeness, 0.25)),
                a(FruitMakers.MyBanana, withA(FruitMakers.ripeness, 0.99))
                ))));
    }

    public static function howToMakeGenericObjects() : void {
        var bananaTree : Tree = make(a(TreeMaker.MyTree,
                withA(TreeMaker.fruit, listOf([a(FruitMakers.MyBanana), a(FruitMakers.MyBanana), a(FruitMakers.MyBanana)]))));
    }
}
}