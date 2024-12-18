import UIKit

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        return []
    }
}

public struct Stack<Element> {
    private var stack: [Element] = []
    public init() { }
    public init(from array: [Element]) {
        self.stack = array
    }

    public mutating func push(_ element: Element) {
        stack.append(element)
    }
    public mutating func pop() -> Element? {
        stack.popLast()
    }
    public var isEmpty: Bool {
        stack.isEmpty
    }
}
