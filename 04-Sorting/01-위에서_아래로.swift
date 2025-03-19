import Foundation

// N을 입력받기
let n = Int(readLine()!)!
// N개의 정수를 입력받아 배열에 저장
var array = [Int]()
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}
// Swift 기본 정렬 라이브러리를 이용하여 정렬 수행
array.sort(by: >)
// 결과 답안 출력
array.forEach { print($0, terminator: " ") }
