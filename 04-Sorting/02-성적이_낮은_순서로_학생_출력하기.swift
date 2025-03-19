import Foundation

// N을 입력받기
let n = Int(readLine()!)!
// N명의 학생 정보를 입력받아 배열에 저장
var students = [(String, Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    // 이름은 문자열 그래도, 점수는 정수형으로 변환하여 저장
    let name = String(input[0])
    let score = Int(input[1])!
    students.append((name, score))
}
// 점수를 기준으로 오름차순으로 정렬
students.sort { $0.1 < $1.1 }
// 결과 답안 출력
students.forEach { print($0.0, terminator: " ") }
