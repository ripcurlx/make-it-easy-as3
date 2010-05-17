package example.fruit.oldskool {
import example.fruit.Apple;

public class OldSkoolBuildersExample {
    public static function howToMakeSimpleObjects() : void {
        var appleWith2Leaves = AppleBuilder.anApple().withLeaves(2);
        var ripeApple = appleWith2Leaves.but().withRipeness(0.9);
        var unripeApple = appleWith2Leaves.but().withRipeness(0.125);

        var apple1 : Apple = ripeApple.build();
        var apple2 : Apple = unripeApple.build();

        var defaultBanana = BananaBuilder.aBanana().build();
    }
}
}