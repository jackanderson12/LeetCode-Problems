import UIKit

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = Stack(from: asteroids)
        
        for i in 1..<asteroids.count {
            if let pop = stack.pop(), let peek = stack.peek() {
                if abs(pop) > abs(peek) && pop < peek {
                    stack.pop() //peek is gone
                    stack.push(pop) //push the pop var back on top of stack
                } else if abs(pop) == abs(peek) && pop < peek {
                    stack.pop()
                }
            }
        }
        
        return stack.stack
    }
}

public struct Stack<Element> {
    public var stack: [Element] = []
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
    public func peek() -> Element? {
        stack.last
    }
    public var isEmpty: Bool {
        stack.isEmpty
    }
}


var sol = Solution()
var testArray = [5,10,-5]
var answer = sol.asteroidCollision(testArray)
print(answer)
