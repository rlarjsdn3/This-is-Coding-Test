import Foundation

// N, M을 공백으로 구분하여 입력받기
let input1 = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input1[0], input1[1])
// 방문한 위치를
var d = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

// 캐릭터의 위치 X, Y와 바라보는 방향 Direction 입력 받기
let input2 = readLine()!.split(separator: " ").map { Int($0)! }
var (x, y, direction) = (input2[0], input2[1], input2[2])
d[x][y] = 1 // 현재 좌표 방문 처리

// 전체 맵 정보를 입력받기
var array = [[Int]]()
for _ in 0..<m {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// 북, 동, 남, 서 방향 정의
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

// 왼쪽으로 회전
func turnLeft() {
    direction -= 1
    if direction == -1 {
        direction = 3
    }
}

// 시뮬레이션 시작
var count = 1
var turnTime = 0
while true {
    // 왼쪽으로 회전
    turnLeft()
    let nx = x + dx[direction]
    let ny = y + dy[direction]
    // 회전한 이후 정면에 가보지 않은 칸이 존재하는 경우 이동
    if array[nx][ny] == 0 && d[nx][ny] == 0 {
        d[nx][ny] = 1
        x = nx
        y = ny
        count += 1
        turnTime = 0
        continue
    // 회전한 이후 정면에 가보지 않은 칸이 없거나 바다인 경우
    } else {
        turnTime += 1
    }
    // 네 방향 모두 갈 수 없는 경우
    if turnTime == 4 {
        let nx = x - dx[direction]
        let ny = y - dy[direction]
        // 뒤로 갈 수 있다면 이동하기
        if array[nx][ny] == 0 {
            x = nx
            y = ny
        // 뒤가 바다로 막혀있는 경우
        } else {
            break
        }
        turnTime = 0
    }
}
// 정답 출력
print(count)
