import SwiftUI
import Foundation

public class Stack<T>: Equatable where T: Equatable {
    public var storage: [T] = []
    public init() { }
    public init(array: [T]) {
        storage = array
    }
    public func push(_ element: T) {
        storage.append(element)
    }
    public func pop() -> T? {
        storage.popLast()
    }
    public var isEmpty: Bool {
        storage.isEmpty
    }
    public var count: Int {
        storage.count
    }
    public static func == (lhs: Stack<T>, rhs: Stack<T>) -> Bool {
        lhs.storage == rhs.storage
    }
}

class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if str1 == str2 {
            return str1
        }
        
        var longerString: String {
            str1.count >= str2.count ? str1 : str2
        }
        var shorterString: String {
            str1.count >= str2.count ? str2 : str1
        }
        var longStack = Stack(array: Array(longerString))
        var shortStack = Stack(array: Array(shorterString))
        var stringToReturn = ""
        
        while (longStack.count >= shortStack.count) &&  (longStack.count > 0) {
            if longStack == shortStack {
                stringToReturn = String(longStack.storage)
            } else {
                longStack.pop()
            }
        }
        
        return stringToReturn
    }
}

var solution = Solution()
var test1 = "ababab"
var test2 = "abab"
var answer = solution.gcdOfStrings(test1, test2)
print(answer)
