import SwiftUI

struct RDDView: View {
    
    @State private var dustin = Dustin_RDD(name: "더스틴", water: Water_RDD(amount: 100))
    
    var body: some View {
        VStack {            
            Text("현재 물의 양 : \(dustin.getWaterAmount())")
            
            Button(action: {
                dustin.drink()
            }, label: {
                Text("물을 마셔보세요")
            })
            .buttonStyle(.borderedProminent)
        }
    }
}

struct Dustin_RDD {
    
    let name: String
    var water: Water_RDD
    
    func getWaterAmount() -> Int {
        water.currentAmount
    }
    
    mutating func drink() {
        // Water에 메시지를 전송하고 있습니다.
        // Dustin은 Water에 amount라는 속성이 있다는 것을 모르며, decrease()라는 행동만 알고 있습니다.
        water.decrease()
    }
}

struct Water_RDD {
    
    // amount 속성을 private로 관리함으로써 캡슐화를 준수하고 있습니다.
    private var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    var currentAmount: Int {
        return amount
    }
    
    // decrease() 행동의 결과로 Water는 자신의 상태인 amount를 직접 변화시킵니다.
    mutating func decrease() {
        guard self.amount >= 10 else {
            return
        }
        self.amount -= 10
    }
}

#Preview {
    RDDView()
}
