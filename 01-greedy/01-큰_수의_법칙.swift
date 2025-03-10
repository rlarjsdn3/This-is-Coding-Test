import Foundation

// N, M, K 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (input[0], input[1], input[2])

// N개의 수를 입력 받기
var numbers = readLine()!.split(separator: " ").map { Int($0)! }

numbers.sort() // 입력받은 수 정렬
let first = numbers[n - 1] // 가장 큰 수
let second = numbers[n - 2] // 두 번째로 큰 수

// 가장 큰 수가 더해지는 횟수 계산
var count = (m / (k + 1)) * k
count += m % (k + 1)

var result = 0
result += count * first
result += (m - count) * second
print(result) // 최종 답안 출력
