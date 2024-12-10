import UIKit
import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/** Looks like a problem for a Stack
    1. Traverse through the LinkedList while pushing all node values to stack
    2. Traverse through the LinkedList, check equivalency while popping all values from stack
*/

public struct Stack<Element> {
    public var stack: [Element] = []
    public init() { }
    
    public mutating func push(_ element: Element) {
        stack.append(element)
    }
    
    public mutating func pop() -> Element? {
        stack.popLast()
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil else { return true }
        guard head?.next != nil else { return true }
        
        var currentNode = head
        var stack: Stack<Int> = Stack()
        
        while currentNode != nil {
            stack.push(currentNode!.val)
            print(stack)
            currentNode = currentNode?.next
        }
        
        currentNode = head
        
        while currentNode != nil {
            if stack.pop() != currentNode?.val {
                return false
            }
            print(stack)
            currentNode = currentNode?.next
        }
        
        return true
    }
}

var sol = Solution()

//LinkedList of 0->1->1->0, should return true
var thirdNode = ListNode(0, nil)
var secondNode = ListNode(1, thirdNode)
var firstNode = ListNode(1, secondNode)
var testHead = ListNode(0, firstNode)

print(sol.isPalindrome(testHead))
