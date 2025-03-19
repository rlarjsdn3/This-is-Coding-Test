import Foundation

final class LinkedQueue<T> {
    
    class LinkedQueueNode {
        var value: T
        var next: LinkedQueueNode?
        
        init(_ value: T) {
            self.value = value
        }
    }
    typealias Node = LinkedQueueNode
    
    private(set) var head: Node?
    private(set) var tail: Node?
    
    var isEmpty: Bool {
        head == nil
    }
    
    func enqueue(_ value: T) {
        let newNode = Node(value)
        enqueue(newNode)
    }
    
    func enqueue(_ newNode: Node) {
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        let removed = head
        head = removed?.next
        removed?.next = nil
        return removed?.value
    }
    
}


typealias Edge = (Int, Int)
typealias Graph = [[Int]]

// BFS 소스코드 구현
func bfs(_ graph: inout Graph, _ x: Int, _ y: Int) -> Int {
    // 큐(Queue) 구현을 위해 LinedQueue 사용
    let queue = LinkedQueue<Edge>()
    queue.enqueue((x, y))
    
    // 큐가 빌 때까지 반복
    while !queue.isEmpty {
        let (x, y) = queue.dequeue()!
        // 현재 위치에서 네 방향으로의 위치 확인
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            // 미로 찾기 공간을 벗어난 경우 무시
            if nx < 0 || ny < 0 || nx >= n || ny >= m {
                continue
            }
            // 벽인 경우 무시
            if graph[nx][ny] == 0 {
                continue
            }
            // 해당 노드를 처음 방문하는 경우에만 최단 거리 기록
            if graph[nx][ny] == 1 {
                graph[nx][ny] = graph[x][y] + 1
                queue.enqueue((nx, ny))
            }
        }
    }
    // 가장 오른쪽 아래까지의 최단 거리 반환
    return graph[n - 1][m - 1]
}

// N, M을 공백으로 구분하여 입력받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
// 2차원 리스트의 맵 정보 입력받기
var graph = Graph(repeating: [], count: n)
for i in 0..<n {
    for e in readLine()! {
        graph[i].append(Int(e)!)
    }
}

// 이동할 네 방향정의(상, 하, 좌, 우)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

// BFS를 수행한 결과 출력
print(bfs(&graph, 0, 0))




extension Int {
    
    init?(_ value: Character) {
        self.init(String(value))
    }
}
