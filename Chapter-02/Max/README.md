# Chapter-02 | 이상한 나라의 객체
`Max` | Java · Swift

---

## 📌 핵심 개념

2장은 객체란 무엇인가에 대한 본질적인 질문에서 시작합니다.  
객체는 세 가지 요소로 구성됩니다.

| 요소 | 설명 |
| :--- | :--- |
| **상태 (State)** | 객체가 현재 어떤 상황에 있는지를 나타냅니다 |
| **행동 (Behavior)** | 객체가 할 수 있는 행위이며, 상태를 변화시킵니다 |
| **식별자 (Identity)** | 상태가 바뀌어도 객체를 구분할 수 있는 고유한 값입니다 |

> 행동이 상태를 결정하고, 행동의 결과는 현재 상태에 의존한다.

---

## 💻 구현 설명

이상한 나라의 앨리스 예시를 통해 세 가지 개념을 Java와 Swift로 각각 표현했습니다.

| 요소 | 코드 | 설명 |
| :--- | :--- | :--- |
| 식별자 | `name` | 상태가 바뀌어도 Alice는 Alice다 |
| 상태 | `height`, `hasDrink` | 행동에 의해 변경되는 값 |
| 행동 | `drinkPotion()`, `eatCake()` | 상태를 직접 변경하는 메서드 |

`enterDoor()` 를 통해 행동의 결과가 현재 상태에 따라 달라진다는 것을 보여줍니다.

### Java vs Swift 비교

| | Java | Swift |
| :--- | :--- | :--- |
| 상태 선언 | `private int height` | `var height: Int` |
| 불변 식별자 | `final String name` | `let name: String` |
| 조건 처리 | `if (!hasDrink)` | `guard !hasDrink else { return }` |

---

## ▶ Run

```bash
# Java
javac Alice.java && java Alice

# Swift (Mac)
swift Alice.swift

# Swift (Windows)
# https://swiftfiddle.com 에서 실행
```

---

## 🤔 회고

<!-- 이번 챕터를 구현하면서 느낀 점, 어려웠던 부분, 추가로 공부할 내용을 자유롭게 작성하세요 -->