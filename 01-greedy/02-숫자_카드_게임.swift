import Foundation

// N, M 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var result = 0
// N만큼 숫자 카드 입력 받기
for _ in 0..<n {
    let cards = readLine()!.split(separator: " ").map { Int($0)! }
    let minValue = cards.min()!
    // '가장 작은 수'들 중에서 가장 큰 값 찾기
    result = max(result, minValue)
}

print(result) // 최종 답안 출력
