# 📘 [Book Study] 객체지향의 사실과 오해

객체지향을 베이스로 한 이후 스터디를 위해, 핵심 개념을 코드로 직접 체득하는 것을 목표로 합니다.

---

## 📂 Directory Structure

```text
.
├── Chapter-01/
│   ├── Max/
│   │   ├── Alice.swift
│   │   ├── PlayingCard.swift
│   │   └── README.md                # 개념 정리 및 코드 설명
│   └── Dustin/
│       ├── Alice.java
│       └── README.md
├── Chapter-02/
└── README.md
```

> 파일명은 구현하는 **객체 이름**을 사용합니다. **PascalCase**를 따릅니다. (e.g. `Alice`, `PlayingCard`)  
> 한 챕터에서 구현이 여러 개라면 각각의 객체 이름으로 파일을 추가하세요.  
> 구현한 개념 설명은 파일명이 아닌 **README.md**에 작성하세요.

---

## 🚀 Branch Strategy

```
main
├── feat/ch01-Max
└── feat/ch01-Dustin
```

- 챕터가 시작될 때 브랜치를 새로 딥니다.
- 같은 챕터 안에서 파일을 추가할 땐 **브랜치를 새로 따지 말고** 같은 브랜치에 커밋을 쌓으세요.
- PR은 챕터 완료 후 `main`으로 올립니다.

---

## ✏️ Commit Convention

| 태그 | 설명 |
| :--- | :--- |
| `feat` | 새로운 코드 구현 |
| `docs` | README 작성 및 수정 |
| `refactor` | 코드 개선 |
| `comment` | 주석 추가 |

**Format**: `태그(ch{n}): 내용`

```
feat(ch01): Alice 객체 상태와 행동 구현
feat(ch02): PlayingCard 식별자 개념 구현
docs(ch01): Alice 개념 정리 README 작성
comment(ch01): drinkPotion 동작 주석 추가
chore: Chapter-03 폴더 및 README 초기화
```

main에 직접 커밋하는 공용 작업의 경우 커밋 메세지 뒤에 이름을 붙여주세요

**Format**: `태그(ch{n}): 내용 - 이름`

```
chore: Chapter-03 폴더 및 README 초기화 - Max
```

---

## 💻 Language & Run

사용 언어는 **Swift** 또는 **Java**만 허용합니다.

```bash
# Swift
swift Alice.swift

# Java
javac Alice.java && java Alice
```

> 각 멤버 폴더의 `README.md`에 코드 실행 방법과 개념 요약을 간단히 적어두세요.  
> 다른 팀원이 바로 실행하고 이해할 수 있어야 합니다.