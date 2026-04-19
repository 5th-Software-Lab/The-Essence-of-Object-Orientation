import SwiftUI

struct NotRDDView: View {
    
    @State private var dustin = Dustin(name: "더스틴", water: Water(amount: 100))
    
    var body: some View {
        VStack {            
            Text("현재 물의 양 : \(dustin.water.amount)")
            
            Button(action: {
                dustin.drink()
            }, label: {
                Text("물을 마셔보세요")
            })
            .buttonStyle(.borderedProminent)
        }
    }
}

struct Dustin {
    let name: String
    var water: Water
    
    // 다른 객체의 상태를 직접 변화시키고 있습니다.
    // 즉, Water 객체의 상태(amount)에 대한 캡슐화가 깨져있습니다.
    mutating func drink() {
        guard water.amount >= 10 else {
            return
        }
        water.amount -= 10
    }
}

// Water 객체는 고립되어있습니다. 어떤 객체와도 협력하지 않습니다.
struct Water {
    var amount: Int
}

#Preview {
    NotRDDView()
}
