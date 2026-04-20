class Customer {
    
    // 구체적인 결제수단이 아닌 프로토콜을 주입받으면
    // 추후 결제수단이 바뀌거나 추가되어도 Customer 클래스는 변경하지 않아도 됩니다.
    private let payment: Payment
    
    init(payment: Payment) {
        self.payment = payment
    }
    
    // Customer는 구체적으로 어떤 결제수단인지 몰라도 결제가 가능합니다.
    func pay() {
        payment.pay()
    }
}
