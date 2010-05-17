package example.fruit {
public class Apple extends Fruit {

    private var leaves : uint;

    public function Apple(leaves : uint) {
        this.leaves = leaves;
    }

    public function numberOfLeaves() : uint {
        return leaves;
    }
}
}