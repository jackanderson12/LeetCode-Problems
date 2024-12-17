import UIKit


public struct Stack<Element> {
    public var stack: [Element] = []
    
    public init() { }
    public init(_ array: [Element]) {
        self.stack = array
    }
    
    public mutating func push(_ element: Element) {
        stack.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        stack.popLast()
    }
    
    public func isEmpty() -> Bool {
        stack.isEmpty
    }
}

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var sum: Stack<String> = Stack()
        var carryOne: Bool = false
        var stackA = Stack(Array(a))
        var stackB = Stack(Array(b))
        
        while !stackA.isEmpty() || !stackB.isEmpty() {
            if stackA.pop() == "0" && stackB.pop() == "0" {
                sum.push("0")
                carryOne = false
            } else if stackA.pop() == "1" && stackB.pop() == "1" {
                if carryOne {
                    sum.push("1")
                } else {
                    sum.push("0")
                }
                carryOne = true
            } else if stackA.pop() == "1" || stackB.pop() == "1" {
                if carryOne {
                    sum.push("0")
                } else {
                    sum.push("1")
                }
                //No need to change carryOne as it will stay the samed
            } else {
                carryOne = false
            }
        }
        
        return ""
    }
}

var sol = Solution()

