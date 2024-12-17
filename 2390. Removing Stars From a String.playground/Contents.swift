import UIKit

class Solution {
    func removeStars(_ s: String) -> String {
        var stack = Stack<String>()
        for char in s {
            if char == "*" {
                stack.pop()
            } else {
                stack.push(String(char))
            }
        }
        var answer = ""
        while !stack.isEmpty {
            answer = stack.pop()! + answer
        }

        return answer
    }
}

public struct Stack<Element> {
    private var stack: [Element] = []
    public init() { }

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

var sol = Solution()
var testString = "leet**cod*e"
print(sol.removeStars(testString))


