import SwiftUI

// 상태는 프로퍼티와 프로퍼티 값으로 구분합니다.
// 프로퍼티는 다시 한 번 속성(단순한 값)과 링크(다른 객체와의 참조)로 구분합니다.

struct Learner {
    let nickname: String
    let learnerCode: String
    var currentChallenge: Int = 1    // 프로퍼티 값
    // 이상 속성
    var studies: [Study]
    // 이상 링크
}

struct Study {
    let name: String
    let domain: String
    // 이상 속성
}
