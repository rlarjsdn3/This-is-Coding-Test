import Foundation

// N, K 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
var (n, k) = (input[0], input[1])

var result = 0
// N이 K 이상이라면 K로 계속 나누기
while n >= k {
    // N이 K로 나누어 떨어지지 않는다면 N을 1로 빼기
    while n % k != 0 {
        n -= 1
        result += 1
    }
    n /= k
    result += 1
}

// 마지막으로 남은 수에 대해서 1씩 빼기
while n > 1 {
    n -= 1
    result += 1
}

print(result) // 최종 답안 출력
