package example.fruit {
public class AppleCart {

    private var apples : Array = new Array();

    public function AppleCart(apples : Array) {

        for each (var apple : Apple in apples) {
            this.apples.push(apple);
        }
    }

    public function currentLoad() : uint {
        return apples.length;
    }

    public function upset() : void {
        apples = new Array();
    }
}
}