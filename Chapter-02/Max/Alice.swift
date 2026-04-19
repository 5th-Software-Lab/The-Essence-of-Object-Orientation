// 상태(State), 행동(Behavior), 식별자(Identity)
// 행동이 상태를 결정하고, 행동의 결과는 현재 상태에 의존한다.

class Alice {

    // 식별자 (Identity)
    let name: String

    // 상태 (State)
    var height: Int
    var hasDrink: Bool

    init(name: String, height: Int) {
        self.name = name
        self.height = height
        self.hasDrink = false
    }

    // 행동 (Behavior) - 상태를 변화시킨다
    func drinkPotion() {
        guard !hasDrink else { return }
        hasDrink = true
        height -= 20
        print("\(name)이 음료를 마셨습니다. 현재 키: \(height)")
    }

    func eatCake() {
        height += 20
        print("\(name)이 케이크를 먹었습니다. 현재 키: \(height)")
    }

    // 행동의 결과는 현재 상태에 의존한다
    func enterDoor(doorHeight: Int) {
        if height <= doorHeight {
            print("문을 통과할 수 있습니다!")
        } else {
            print("키가 너무 큽니다. 문을 통과할 수 없습니다.")
        }
    }
}

let alice = Alice(name: "Alice", height: 120)

alice.enterDoor(doorHeight: 50)  // 통과 불가
alice.drinkPotion()              // 행동 → 상태 변화
alice.enterDoor(doorHeight: 50)  // 통과 가능
alice.eatCake()                  // 행동 → 상태 변화
alice.enterDoor(doorHeight: 50)  // 다시 통과 불가