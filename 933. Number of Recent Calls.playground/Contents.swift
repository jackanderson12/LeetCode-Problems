import UIKit

public struct Queue<T> {
    private var array: [T] = []
    public init() { }
    public var isEmpty: Bool {
        array.isEmpty
    }
    public var peek: T? {
        array.first
    }
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}

class RecentCounter {
    var queue: Queue<Int>

    init() {
        queue = Queue<Int>()
    }
    
    func ping(_ t: Int) -> Int {
        queue.enqueue(t)
        if !queue.isEmpty {
            while t - 3000 > queue.peek! {
                queue.dequeue()
            }
        }
        return 0
    }
}
