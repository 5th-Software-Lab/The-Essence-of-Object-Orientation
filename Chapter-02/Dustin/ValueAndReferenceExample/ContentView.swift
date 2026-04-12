import SwiftUI

struct ContentView: View {
    
    private let max = StudentStruct(name: "맥스", age: 20)
    private let mulgae = StudentStruct(name: "물개", age: 20)
    
    private let myong = StudentClass(name: "묭", age: 20)
    private let myong2 = StudentClass(name: "묭", age: 20)
    
    var body: some View {
        VStack {
            // 동등성 : 값 타입은 인스턴스가 서로 달라도 상태가 같다면 서로 같다고 인식해요. (Equatable 프로토콜 채택 필요)
            Text(max == mulgae ? "Same!" : "Different!")
            
            // 동일성 : 참조 타입은 상태가 서로 같아도 다른 인스턴스라면 서로 다르다고 인식해요.
            // 즉, 참조 타입은 서로 식별자가 같아야 합니다.
            // === : 서로 같은 인스턴스인지 판단하는 연산자
            Text(myong === myong2 ? "Same!" : "Different!")
            Text(myong === myong ? "Same!" : "Different!")
        }
    }
}
