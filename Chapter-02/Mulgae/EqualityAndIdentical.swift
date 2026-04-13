import Foundation

// MARK: - 값 타입(Struct): 동등성(Equality) 비교

// Equatable을 채택하면 == 연산자로 "값이 같은지" 비교할 수 있습니다.
struct PersonStruct: Equatable {
	let face: String
	let wealth: String
}

let 더스틴 = PersonStruct(face: "Handsome", wealth: "Rich")
let 차은우 = PersonStruct(face: "Handsome", wealth: "Rich")
let 더스핑킹가위 = 더스틴

// 값 타입은 대입 시 복사되므로, 값이 같으면 true
print("[Struct] 더스틴 == 차은우 :", 더스틴 == 차은우) // true
print("[Struct] 더스틴 == 더스핑킹가위 :", 더스틴 == 더스핑킹가위) // true

// MARK: - 참조 타입(Class): 동등성 + 동일성 비교

// 클래스도 Equatable을 채택하면 == 로 "내용 비교"를 정의할 수 있습니다.
class PersonClass: Equatable {
	let face: String
	let brain: String

	init(face: String, brain: String) {
		self.face = face
		self.brain = brain
	}

	// 동등성(값/내용 비교) 정의
	static func == (lhs: PersonClass, rhs: PersonClass) -> Bool {
		return lhs.face == rhs.face && lhs.brain == rhs.brain
	}
}

let 맥스 = PersonClass(face: "Handsome", brain: "Smart")
let 리오르 = PersonClass(face: "Handsome", brain: "Smart")
let 박신영 = 맥스

// 동등성(==): 내용이 같으면 true
print("[Class] 맥스 == 리오르 :", 맥스 == 리오르) // true (내용 동일)
print("[Class] 맥스 == 박신영 :", 맥스 == 박신영) // true (내용 동일)

// 동일성(===): 같은 인스턴스(같은 메모리 참조)인지 비교
print("[Class] 맥스 === 리오르:", 맥스 === 리오르) // false (서로 다른 인스턴스)
print("[Class] 맥스 === 박신영:", 맥스 === 박신영) // true (같은 인스턴스 참조)

