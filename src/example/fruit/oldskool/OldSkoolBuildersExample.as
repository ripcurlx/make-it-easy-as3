package example.fruit.oldskool {
import example.fruit.Apple;

public class OldSkoolBuildersExample {
    public static function howToMakeSimpleObjects() : void {
        var appleWith2Leaves : AppleBuilder = AppleBuilder.anApple().withLeaves(2);
        var ripeApple : AppleBuilder = appleWith2Leaves.but().withRipeness(0.9);
        var unripeApple : AppleBuilder = appleWith2Leaves.but().withRipeness(0.125);

        var apple1 : Apple = ripeApple.build();
        var apple2 : Apple = unripeApple.build();

        var defaultBanana : BananaBuilder = BananaBuilder.aBanana().build();
    }
}
}