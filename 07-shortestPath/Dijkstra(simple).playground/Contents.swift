import Foundation

let INF = Int.max // 무한을 의미하는 값으로 Int형 최대값을 설정

let n = 6  // 노드의 개수
let m = 11 // 간선의 개수
let start = 1 // 시작 노드
// 각 노드에 연결되어 있는 노드에 대한 정보를 담는 배열 만들기
let graph = [
    [], // a번 노드에서 b번 노드로 가는 비용이 c라는 의미
    /* 1번 노드 */ [(2, 2), (3, 5), (4, 1)],
    /* 2번 노드 */ [(3, 3), (4, 2)],
    /* 3번 노드 */ [(2, 3), (6, 5)],
    /* 4번 노드 */ [(3, 3), (5, 1)],
    /* 5번 노드 */ [(3, 1), (6, 2)],
    /* 6번 노드 */ []
]

// 방문한 적이 있는지 체크하는 목적의 배열 만들기
var visited = Array(repeating: false, count: n + 1)
// 최단 거리 테이블을 모두 무한으로 초기화
var distance = Array(repeating: INF, count: n + 1)

// 방문하지 않은 노드 중에서, 가장 최단 거리가 짧은 노드의 번호를 반환
@MainActor func getSmallestNode() -> Int {
    var index = 0
    var minValue = INF
    for i in 1...n {
        if distance[i] < minValue && !visited[i] {
            minValue = distance[i]
            index = i
        }
    }
    return index
}

@MainActor func dijkstra(_ start: Int) {
    // 시작 노드에 대해서 초기화
    distance[start] = 0
    visited[start] = true
    for j in graph[start] {
        distance[j.0] = j.1
    }
    
    // 시작 노드를 제외한 전체 n - 1개의 노드에 대해 반복
    for i in 1...n {
        // 현재 최단 거리가 가장 짧은 노드를 꺼내서, 방문 처리
        let now = getSmallestNode()
        visited[now] = true
        // 현재 노드와 연결된 다른 노드를 확인
        for j in graph[now] {
            let cost = distance[now] + j.1
            // 현재 노드를 거쳐서 다른 노드로 이동하는 거리가 더 짧으면
            if cost < distance[j.0] {
                distance[j.0] = cost
            }
        }
    }
}

// 다익스트라 알고리즘 수행
dijkstra(start)

// 모든 노드로 가기 위한 최단 거리를 출력
for i in 1...n {
    // 도달할 수 없는 경우, INF라고 출력
    if distance[i] == INF {
        print("INF")
    } else {
        print(distance[i])
    }
}
