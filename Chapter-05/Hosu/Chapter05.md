# 객체지향 핵심 개념 정리

---

## 📌 개념 1 — 책임 (Responsibility)

- **하는 것 (doing)** — 직접 행동을 수행하거나, 다른 객체의 행동을 시작시키거나
- **아는 것 (knowing)** — 자신의 정보를 알고, 관련 객체를 알고

중요한 건 객체를 설계할 때 **"이 객체가 어떤 데이터를 가질까?"가 아니라 "이 객체가 무엇을 책임지는가?"** 를 먼저 생각해야 한다는 거예요.

### 코드

```swift
// ❌ 데이터 중심 설계 — "무엇을 가지는가"에 집중
struct BadBarista {
    var name: String
    var coffeeType: String
    var milk: String
    var shot: Int
    // 데이터만 나열되어 있고, 이 객체가 뭘 "해야 하는지"가 보이지 않음
}

// ✅ 책임 중심 설계 — "무엇을 하는가 / 아는가"에 집중
struct Barista {

    private let name: String

    init(name: String) {
        self.name = name
    }

    // 하는 것 (doing) — 음료를 만드는 행동을 직접 수행
    func makeDrink(order: String) -> String {
        return "\(name)가 '\(order)'를 제조했습니다."
    }

    // 아는 것 (knowing) — 자신의 상태 정보를 알고 있음
    func introduce() -> String {
        return "저는 바리스타 \(name)입니다."
    }
}

let barista = Barista(name: "지수")
print(barista.introduce())                    // 저는 바리스타 지수입니다.
print(barista.makeDrink(order: "아메리카노")) // 지수가 '아메리카노'를 제조했습니다.
```

**핵심 포인트:** `BadBarista`는 데이터 보관함에 불과해요. `Barista`는 책임을 가진 객체예요. 설계 시작점이 다른 거죠.

---

## 📌 개념 2 — 메시지와 메서드 (Message & Method)

- **메시지** — 객체에게 무언가를 요청하는 것. *"음료 만들어줘"*
- **메서드** — 그 요청을 받은 객체가 **스스로** 어떻게 처리할지 결정하는 것

핵심은 **메시지를 보내는 쪽은 수신자가 어떻게 처리하는지 알 수도 없고, 알 필요도 없다** 는 거예요.

### 코드

```swift
// 메시지: "음료를 만들어줘" (make)
// 메서드: 각 객체가 그 메시지를 자기 방식대로 처리

protocol DrinkMaker {
    func make(order: String) -> String   // ← 이게 "메시지"의 형태
}

struct HumanBarista: DrinkMaker {
    // 같은 메시지를 받았지만, 처리 방식(메서드)은 자기 방식대로
    func make(order: String) -> String {
        return "손으로 직접 '\(order)'를 내립니다."
    }
}

struct MachineBarista: DrinkMaker {
    // 메시지는 동일하지만, 처리 방식은 전혀 다름
    func make(order: String) -> String {
        return "자동 머신으로 '\(order)'를 추출합니다."
    }
}

// 메시지를 보내는 쪽 — 수신자가 누군지, 어떻게 처리하는지 신경 쓰지 않음
func serveDrink(maker: DrinkMaker, order: String) {
    let result = maker.make(order: order)   // ← 메시지를 보내는 행위
    print(result)
}

serveDrink(maker: HumanBarista(), order: "핸드드립")
// 손으로 직접 '핸드드립'를 내립니다.

serveDrink(maker: MachineBarista(), order: "아메리카노")
// 자동 머신으로 '아메리카노'를 추출합니다.
```

**핵심 포인트:** `serveDrink`는 `make`라는 메시지만 보낼 뿐이에요. `HumanBarista`가 처리하든 `MachineBarista`가 처리하든 관심 없어요. 메시지와 메서드가 분리된 거예요.

---

## 📌 개념 3 — 책임-주도 설계 (Responsibility-Driven Design)

1. **What** — 시스템이 해야 할 일(메시지)이 무엇인가?
2. **Who** — 그 메시지를 처리하기에 적합한 객체는 누구인가?
3. 그 객체에게 책임을 부여하고, 필요하면 다른 객체에게 도움을 요청

"클래스를 먼저 만들고 메서드를 채워넣는" 게 아니라, **메시지(협력)가 먼저, 객체는 나중** 이라는 설계 철학이에요.

### 코드

```swift
// 설계 흐름을 주석으로 따라가 보세요

// [What] 카페 시스템이 해야 할 일: "주문을 처리해줘"
// [Who] 그 책임을 질 객체: Cashier (계산대)

struct Order {
    let menu: String
    let quantity: Int
}

struct Cashier {
    // [What] 주문을 받아야 한다
    // [Who] Cashier가 주문 접수를 책임진다
    func receive(order: Order) -> String {
        // 음료 제조는 내 책임이 아님 → Barista에게 메시지를 보냄
        let barista = Barista(name: "민준")
        return barista.makeDrink(order: order.menu)

        // [What] 음료를 만들어야 한다
        // [Who] 그 책임은 Barista가 진다
    }
}

// 주문 흐름
let cashier = Cashier()
let order = Order(menu: "라떼", quantity: 1)
let result = cashier.receive(order: order)
print(result)   // 민준가 '라떼'를 제조했습니다.
```

**핵심 포인트:** `Cashier`는 음료를 어떻게 만드는지 몰라요. "만들어줘"라는 메시지를 `Barista`에게 보낼 뿐이에요. What → Who 흐름으로 책임이 자연스럽게 분배된 거예요.

---

## 📌 개념 4 — 책임의 자율성

> 객체는 자신의 책임을 **어떻게 수행할지 스스로 결정** 한다

외부에서 내부 처리 방식을 지시하거나 간섭하면 안 돼요. 객체는 메시지를 받고, 그 처리 방법은 자기가 결정하는 거예요. 이게 **캡슐화** 와 연결되는 지점이에요.

### 코드

```swift
// ❌ 자율성 없는 객체 — 외부에서 처리 방식을 지시
struct BadCoffee {
    var shots: Int
    var milkAmount: Int
    var temperature: Int
}

struct BadBarista2 {
    func make(coffee: BadCoffee) -> String {
        // 외부에서 이미 shots, milk, temperature 다 결정해서 넘겨줌
        // 바리스타는 그냥 조립만 할 뿐 — 자율성이 없음
        return "샷 \(coffee.shots)개, 우유 \(coffee.milkAmount)ml, 온도 \(coffee.temperature)도로 제조"
    }
}

// ✅ 자율성 있는 객체 — 처리 방식을 스스로 결정
struct AutonomousBarista {
    private let specialRecipe = "시크릿 레시피"   // 외부에서 알 수 없음

    // 메시지: "라떼 만들어줘"만 받음
    // 어떻게 만들지는 스스로 결정
    func makeLatte() -> String {
        let shots = decideShots()
        let milk = decideMilk()
        return "\(specialRecipe)로 샷 \(shots)개, 우유 \(milk)ml 라떼 완성"
    }

    // 내부 결정 — 외부에 노출하지 않음 (private)
    private func decideShots() -> Int { return 2 }
    private func decideMilk() -> Int { return 180 }
}

let autonomousBarista = AutonomousBarista()
print(autonomousBarista.makeLatte())
// 시크릿 레시피로 샷 2개, 우유 180ml 라떼 완성
```

**핵심 포인트:** `AutonomousBarista`는 "라떼 만들어줘"라는 메시지만 받아요. 샷을 몇 개 넣는지, 우유를 얼마나 쓰는지는 외부에서 알 수도, 간섭할 수도 없어요. 자율성이 있는 거예요.

---

## 📌 개념 5 — 인터페이스 (Interface)

- **공용 인터페이스** — 외부에 공개된 메시지의 집합. 다른 객체가 보낼 수 있는 메시지
- **구현** — 인터페이스 뒤에 숨겨진 처리 방법. 외부에서 알 필요 없는 것

좋은 설계는 **인터페이스는 최소화하고, 구현은 최대한 숨기는 것** 이에요.

### 코드

```swift
// protocol이 공용 인터페이스를 명시적으로 정의하는 도구예요

protocol CafeService {
    // 공용 인터페이스 — 외부에서 보낼 수 있는 메시지 목록
    func takeOrder(menu: String) -> String
    func calculatePrice(menu: String) -> Int
}

struct CafeStaff: CafeService {

    // ✅ 공용 인터페이스 — 외부에 노출
    func takeOrder(menu: String) -> String {
        let price = calculatePrice(menu: menu)
        return recordOrder(menu: menu, price: price)  // 내부 메서드 활용
    }

    func calculatePrice(menu: String) -> Int {
        return priceTable[menu] ?? 0   // 가격표는 외부에 안 보임
    }

    // ✅ 구현 (implementation) — 외부에 숨김
    private let priceTable = ["아메리카노": 4000, "라떼": 4500, "케이크": 6000]

    private func recordOrder(menu: String, price: Int) -> String {
        return "'\(menu)' 주문 완료. 금액: \(price)원"
    }
}

let staff = CafeStaff()
// 외부에서는 공용 인터페이스만 사용 가능
print(staff.takeOrder(menu: "라떼"))         // '라떼' 주문 완료. 금액: 4500원
print(staff.calculatePrice(menu: "케이크"))  // 6000

// staff.priceTable       ← 접근 불가 (private)
// staff.recordOrder(...) ← 접근 불가 (private)
```

**핵심 포인트:** 외부는 `takeOrder`, `calculatePrice` 두 개의 메시지만 알아요. 내부에서 어떤 가격표를 쓰는지, 어떻게 기록하는지는 완전히 숨겨져 있어요.

---

## 📌 종합 코드 — 다섯 개념이 모두 담긴 카페

```swift
import Foundation

// ============================================================
// 인터페이스 정의 (개념5)
// 외부에 공개할 메시지의 집합을 protocol로 명시
// ============================================================

protocol Orderable {                         // 주문 받을 수 있는 인터페이스
    func receive(menu: String) -> String
}

protocol Brewable {                          // 음료 만들 수 있는 인터페이스
    func brew(menu: String) -> String
}

// ============================================================
// 책임 중심 설계 (개념1)
// 각 객체가 "무엇을 하는가"로 정의됨
// ============================================================

struct Customer {
    let name: String

    // 하는 것: 주문을 한다
    func placeOrder(to cashier: Orderable, menu: String) -> String {
        return cashier.receive(menu: menu)   // 메시지를 보냄 (개념2)
    }
}

// ============================================================
// 책임-주도 설계 흐름 (개념3)
// What: 주문을 접수해야 한다
// Who: Cashier가 그 책임을 진다
// ============================================================

struct Cashier: Orderable {

    private let barista: Brewable   // 내부 협력자 — 외부에 숨김 (개념5)

    init(barista: Brewable) {
        self.barista = barista
    }

    // 공용 인터페이스 — 주문 접수
    func receive(menu: String) -> String {
        let receipt = issueReceipt(menu: menu)   // 내부 처리 (개념4 자율성)
        let drink = barista.brew(menu: menu)     // Barista에게 메시지 (개념2, 개념3)
        return "\(receipt)\n\(drink)"
    }

    // 구현 — 외부에 숨김 (개념5)
    private func issueReceipt(menu: String) -> String {
        return "영수증 발행: \(menu)"
    }
}

// ============================================================
// 메시지와 메서드의 분리 + 책임의 자율성 (개념2, 개념4)
// 같은 메시지(brew)를 받지만, 처리 방식은 스스로 결정
// ============================================================

struct HandBarista: Brewable {
    func brew(menu: String) -> String {
        return "☕ 핸드드립으로 '\(menu)' 완성"   // 자율적으로 방식 결정
    }
}

struct MachineBarista: Brewable {
    func brew(menu: String) -> String {
        return "🤖 자동 머신으로 '\(menu)' 완성"  // 자율적으로 방식 결정
    }
}

// ============================================================
// 실행 — 협력의 흐름
// ============================================================

let customer = Customer(name: "석호")

// HandBarista를 쓰는 카페
let cafeA = Cashier(barista: HandBarista())
print("=== 카페 A ===")
print(customer.placeOrder(to: cafeA, menu: "아메리카노"))

// MachineBarista를 쓰는 카페
let cafeB = Cashier(barista: MachineBarista())
print("\n=== 카페 B ===")
print(customer.placeOrder(to: cafeB, menu: "아메리카노"))

// 출력:
// === 카페 A ===
// 영수증 발행: 아메리카노
// ☕ 핸드드립으로 '아메리카노' 완성
//
// === 카페 B ===
// 영수증 발행: 아메리카노
// 🤖 자동 머신으로 '아메리카노' 완성
```