import Foundation

typealias Graph = [[Int]]

// DFS 정의
func dfs(_ graph: Graph, _ v: Int, _ visited: inout [Bool]) {
    // 현재 노드를 방문 처리
    visited[v] = true
    print(v, terminator: " ")
    // 현재 노드와 연결된 다른 노드를 재귀적으로 방문
    for v in graph[v] {
        // 해당 노드에 아직 방문하지 않았다면
        if !visited[v] {
            dfs(graph, v, &visited)
        }
    }
}

// 각 노드가 연결된 정보를 인접 리스트(배열)로 표현
let graph = [
    [],
    /* 1 */ [2, 3, 8],
    /* 2 */ [1, 7],
    /* 3 */ [1, 4, 5],
    /* 4 */ [3, 5],
    /* 5 */ [3, 4],
    /* 6 */ [7],
    /* 7 */ [2, 6, 8],
    /* 8 */ [1, 7]
]

// 각 노드가 방문된 정보를 배열 자료형으로 표현
var visited = [Bool](repeating: false, count: 9)

// 정의된 DFS 함수 호출
dfs(graph, 1, &visited)
