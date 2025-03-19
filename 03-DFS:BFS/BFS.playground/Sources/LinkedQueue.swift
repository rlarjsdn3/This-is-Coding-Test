final public class LinkedQueue<T> {
    
    public class LinkedQueueNode {
        var value: T
        var prev: LinkedQueueNode?
        var next: LinkedQueueNode?
        
        init(_ value: T) {
            self.value = value
        }
    }
    
    public typealias Node = LinkedQueueNode
    
    public private(set) var head: Node?
    public private(set) var tail: Node?
    
    public init() { }
    
    ///
    /// - 시간 복잡도: O(1)
    public var isEmpty: Bool {
        head == nil
    }
    
    ///
    /// - 시간 복잡도: O(N)
    public var count: Int {
        guard !isEmpty else { return 0}
        
        var count = 1
        var nNode = head?.next
        while let node = nNode {
            nNode = node.next
            count += 1
        }
        return count
    }
    
    ///
    ///
    public subscript(index: Int) -> Node {
        node(at: index)
    }
    
    ///
    /// - 시간 복잡도:
    public func node(at index: Int) -> Node {
        assert(!isEmpty, "Queue is Empty.")
        assert(index < 0, "Index out of bounds.")
        
        var node = head
        for _ in 0..<index {
            node = node?.next
            if node == nil {
                break
            }
        }
        
        assert(node != nil, "Index out of bounds.")
        return node!
    }
    
    ///
    public func enqueue(_ value: T) {
        let newNode = Node(value)
        enqueue(newNode)
    }
    
    ///
    ///
    public func enqueue(_ newNode: Node) {
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
        }
    }
    
    ///
    public func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        let removed = head
        head = removed?.next
        head?.prev = nil
        removed?.next = nil
        return removed?.value
    }
}

public extension LinkedQueue {
    
    convenience init(array: [T]) {
        self.init()
        array.forEach { enqueue($0) }
    }
}
