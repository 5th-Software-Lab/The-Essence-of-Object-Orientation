import Foundation

// Alice: 상태(state) + 행동(behavior) + 식별자(identity)를 가진 객체

class Alice {
    // 식별자 (Identity): 각 Alice 인스턴스를 유일하게 구분
    let id: UUID
    let name: String
    
    // 상태 (State): 객체가 가진 현재 값들
    private var height: Double
    
    // 생성자
    init(name: String, height: Double) {
        self.id = UUID()
        self.name = name
        self.height = height
    }
    
    // 행동 (Behavior): 상태를 변경하는 메서드
    func drinkPotion() {
        height /= 2
        print("\(name)이(가) 물약을 마셨다. 키: \(height)cm")
    }
    
    func eatCake() {
        height *= 2
        print("\(name)이(가) 케이크를 먹었다. 키: \(height)cm")
    }
    
    func introduce() {
        print("나는 \(name), 현재 키는 \(height)cm (id: \(id))")
    }
}

let alice1 = Alice(name: "Alice", height: 120)
let alice2 = Alice(name: "Alice", height: 120)

alice1.introduce()
alice2.introduce()

// 식별자로 구분됨. 상태가 같아도 서로 다른 객체
print("같은 객체인가? \(alice1 === alice2)")  // false 나옴

// 행동을 통해 상태가 변함
alice1.drinkPotion()
alice1.eatCake()
alice1.introduce()