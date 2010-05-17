package example.fruit {
public class Fruit {
    private var ripeness : Number = 0.0;

    public function ripen(amount : Number) : void {
        ripeness = Math.min(1.0, ripeness + amount);
    }

    public function isRipe() : Boolean {
        return ripeness == 1.0;
    }
}
}