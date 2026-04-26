import Foundation

protocol Witness {
    func testify()    
}

// 왕은 상대가 누구든 testify()라는 메시지만 이해하면 됨

class Hatter: Witness {
    func testify() {
        print("모자  장수가 기억을 되짚으며 증언")
    }
}

class Cook: Witness {
    func testify() {
        print("요리사가 메모를 읽으며 증언")
    }
}

class Alice: Witness {
    func testify() {
        print("앨리스가 경험을 바탕으로 증언")
    }
}

// 각 객체는 자신만의 방법(여기서는 메서드)으로 메시지를 처리함

class King {
    func askToTestify(to Witness: Witness) {
        print("증언 고고링")
        Witness.testify()
    }
}

let king = King()
let hatter = Hatter()
let cook = Cook()

king.askToTestify(to: hatter)
king.askToTestify(to: cook)

