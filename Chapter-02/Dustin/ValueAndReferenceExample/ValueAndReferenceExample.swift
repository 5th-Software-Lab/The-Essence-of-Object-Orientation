import SwiftUI

// Equtable 프로토콜을 채택하면 자동으로 == 메서드를 구현해줍니다.
struct StudentStruct: Equatable {
    let name: String
    let age: Int
    
    // == 메서드를 커스텀하는 것도 가능합니다.
    // static func ==(lhs: StudentStruct, rhs: StudentStruct) -> Bool {
    //     return lhs.name == rhs.name
    // }
}

class StudentClass {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
