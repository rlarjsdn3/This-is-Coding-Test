import Foundation

// N과 K 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
// 배열 A의 모든 원소 입력 받기
var a = readLine()!.split(separator: " ").map { Int($0)! }
// 배열 B의 모든 원소 입력 받기
var b = readLine()!.split(separator: " ").map { Int($0)! }

a.sort() // 배열 A는 오름차순 정렬
b.sort(by: >) // 배열 B는 내림차순 정렬

// 첫 번째 인덱스부터 확인하며, 두 배열의 원소를 최대 K번 비교
for i in 0..<k {
    if a[i] < b[i] {
        a[i] = b[i]
    }
}
// 결과 답안 출력
let result = a.reduce(0, +)
print(result)
