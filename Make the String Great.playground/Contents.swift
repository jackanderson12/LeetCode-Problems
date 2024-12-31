import UIKit

public struct QueueArray<T> {
    private var array: [T] = []
    public init() { }
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
    public var isEmpty: Bool {
        array.isEmpty
    }
    public var peek: T? {
        array.first
    }
}

class Solution {
    var prevStringCount = -1
    
    func makeGood(_ s: String) -> String {
        prevStringCount = s.count
        var queue = QueueArray<Character>()
        var goodString = ""
        for i in s {
            queue.enqueue(i)
        }
        while !queue.isEmpty {
            guard var element = queue.dequeue() else { break }
            guard var peek = queue.peek else {
                goodString.append(element)
                break
            }
            if element.uppercased() != String(peek) {
                if String(element) != peek.uppercased() {
                    goodString.append(element)
                } else {
                    if String(element) == String(peek) {
                        goodString.append(element)
                    } else {
                        queue.dequeue()
                    }
                }
            } else {
                if String(element) == String(peek) {
                    goodString.append(element)
                } else {
                    queue.dequeue()
                }
            }
        }
        if goodString == "" {
            return ""
        } else if goodString.count == prevStringCount {
            return goodString
        } else {
            return makeGood(goodString)
        }
    }
}

var sol = Solution()
var test = "abBAcC"
var test2 = "about"
var test3 = "leEeetcode"
var test4 = "pP"
var test5 = "PpaPP"
var testString = sol.makeGood(test)
var testString2 = sol.makeGood(test2)
var testString3 = sol.makeGood(test3)
var testString4 = sol.makeGood(test4)
var testString5 = sol.makeGood(test5)

