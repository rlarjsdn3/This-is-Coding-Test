import Foundation

typealias Graph = [[Int]]

// DFS로 특정한 노드를 방문한 뒤에 연결된 모든 노드들도 방문
@discardableResult func dfs(_ graph: inout Graph, _ x: Int, _ y: Int) -> Bool {
    // 주어진 범위를 벗어나는 경우에는 즉시 종료
    if x < 0 || y < 0 || x >= n || y >= m {
        return false
    }
    // 현재 노드에 아직 방문하지 않았다면
    if graph[x][y] == 0 {
        // 해당 노드 방문 처리
        graph[x][y] = 1
        // 상, 하, 좌, 우의 위치도 모두 재귀적으로 호출
        dfs(&graph, x, y - 1)
        dfs(&graph, x, y + 1)
        dfs(&graph, x - 1, y)
        dfs(&graph, x + 1, y)
        return true
    }
    return false
}

// N, M을 공백으로 구분하여 입력받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

// 2차원 리스트의 맵 정보 입력 받기
var graph = Graph(repeating: [Int](), count: n)
for i in 0..<n {
    for e in readLine()! {
        graph[i].append(Int(e)!)
    }
}

// 모든 노드(위치)에 대하여 음료수 채우기
var result = 0
for x in 0..<n {
    for y in 0..<m {
        // 현재 위치에서 DFS 수행
        if dfs(&graph, x, y) {
            result += 1
        }
    }
}
print(result) // 정답 출력

extension Int {
    
    init?(_ value: Character) {
        self.init(String(value))
    }
}
