package example.fruit {
public class Tree {

    public var fruit : Array = new Array();

    public function Tree(fruits : Array) {
        for each (var fruit : Fruit in fruits) {
            this.fruit.push(fruit);
        }
    }
}
}