protocol Payment {
    func pay()
}

class CreditCard: Payment {
    
    private var money: Int
    
    init(money: Int) {
        self.money = money
    }
    
    func pay() {
        self.money -= 10
        print("신용카드로 결제합니다.")
        print("잔액 : \(money)")
    }
}

class Cash: Payment {
    
    private var money: Int
    
    init(money: Int) {
        self.money = money
    }
    
    func pay() {
        self.money -= 10
        print("현금으로 결제합니다.")
        print("잔액 : \(money)")
    }
}
