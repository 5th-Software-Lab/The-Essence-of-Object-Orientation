// Chapter-02: 이상한 나라의 객체
// 핵심 개념: 객체는 상태(state), 행동(behavior), 식별자(identity)를 가진다.
// 행동이 상태를 변화시키고, 행동의 결과는 현재 상태에 의존한다.

public class Alice {

    // 상태 (State) - 객체의 현재 상태를 나타내는 프로퍼티
    private int height;
    private boolean hasDrink;

    // 식별자 (Identity) - 다른 객체와 구분하는 고유한 값
    private final String name;

    public Alice(String name, int height) {
        this.name = name;
        this.height = height;
        this.hasDrink = false;
    }

    // 행동 (Behavior) - 상태를 변화시킨다
    public void drinkPotion() {
        if (!hasDrink) {
            this.hasDrink = true;
            this.height -= 20;  // 음료를 마시면 키가 줄어든다
            System.out.println(name + "이 음료를 마셨습니다. 현재 키: " + height);
        }
    }

    public void eatCake() {
        this.height += 20;  // 케이크를 먹으면 키가 커진다
        System.out.println(name + "이 케이크를 먹었습니다. 현재 키: " + height);
    }

    // 행동의 결과는 현재 상태에 의존한다
    public void enterDoor(int doorHeight) {
        if (this.height <= doorHeight) {
            System.out.println("문을 통과할 수 있습니다!");
        } else {
            System.out.println("키가 너무 큽니다. 문을 통과할 수 없습니다.");
        }
    }

    public static void main(String[] args) {
        Alice alice = new Alice("Alice", 120);

        alice.enterDoor(50);   // 통과 불가 - 현재 상태에 의존
        alice.drinkPotion();   // 행동 → 상태 변화
        alice.enterDoor(50);   // 통과 가능 - 상태가 바뀌었으므로 결과도 다르다
        alice.eatCake();       // 행동 → 상태 변화
        alice.enterDoor(50);   // 다시 통과 불가 
    }
}