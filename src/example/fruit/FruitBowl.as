package example.fruit {
public class FruitBowl {

    private var contents : Array = new Array();

    public function FruitBowl(contents : Array) {
        for each (var fruit : Fruit in contents) {
            this.contents.push(fruit);
        }
    }

    public function isEmpty() : Boolean {
        return contents.isEmpty();
    }

    public function takeOne() : Fruit {
        return contents.pop();
    }
}
}