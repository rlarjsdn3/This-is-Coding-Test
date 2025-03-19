import Foundation

typealias Graph = [[Int]]

// BFS 정의
func bfs(_ graph: Graph, _ v: Int, _ visited: inout [Bool]) {
    // 큐(Queue) 사용을 위해 LinkedQueue 구현
    let queue = LinkedQueue<Int>(array: [v])
    // 현재 노드 방문 처리
    visited[v] = true

    // 큐가 빌 때까지 반복
    while !queue.isEmpty {
        // 큐에서 하나의 원소를 뽑아 출력
        let v = queue.dequeue()!
        print(v, terminator: " ")
        
        // 해당 원소에 인접한, 아직 방문하지 않은 원소들을 큐에 삽입
        for i in graph[v] {
            if !visited[i] {
                queue.enqueue(i)
                visited[i] = true // 이미 삽입된 원소가 다시 삽입되지 않도록 노드 방문 처리
            }
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
bfs(graph, 1, &visited)
