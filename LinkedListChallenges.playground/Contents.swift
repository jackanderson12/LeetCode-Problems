import UIKit
import Foundation

//Code Implementation for the Node
public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(_ value: Value,_ next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

//Code implementation for the LinkedList
public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() { }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    //Swift Collection needs 1-4
    //1.
    public var startIndex: Index {
        Index(node: head)
    }
    //2.
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    //3.
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    //4.
    public subscript(position: Index) -> Value {
        position.node!.value
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value, head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        guard isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value, nil)
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value, node.next)
        
        return node.next!
    }
    
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    public mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        guard let node = copyNodes(returningCopyOf: node) else {
            return nil
        }
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    //Making LinkedList Copy-On-Write
    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        guard var oldNode = head else {
            return nil
        }
        
        head = Node(oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        return nodeCopy
    }
}

//Making LinkedList Conform to Collection, Added 1-4 above for conformance
extension LinkedList: Collection {
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) {
                $0?.next
            }
            return nodes.contains { $0 === rhs.node }
        }
    }
}


public class Solution {
    public func reversePrintNodes<T>(_ node: Node<T>?){
        guard let node = node else { return }
        reversePrintNodes(node.next)
        print(node.value)
    }
    
    public func findMiddleNode<T>(_ linkedList: LinkedList<T>) -> Node<T>? {
        guard !linkedList.isEmpty else { return nil }
        var current = linkedList.head
        var count = 0
        while current != nil {
            count += 1
            current = current!.next
        }
        return linkedList.node(at: count / 2)
    }
    
    //Solution provided by book is faster
    public func getMiddle<T>(_ linkedList: LinkedList<T>) -> Node<T>? {
        var slow = linkedList.head
        var fast = linkedList.head
        
        while let nextFast = fast?.next {
            fast = nextFast.next
            slow = slow?.next
        }
        return slow
    }
    
    //O(n) speed, but also O(n) space
    public func reverseLinkedList<T>(_ linkedList: LinkedList<T>) -> LinkedList<T>? {
        guard !linkedList.isEmpty else { return nil }
        guard linkedList.head !== linkedList.tail else { return linkedList }
        var current = linkedList.head
        var reversedList = LinkedList<T>()
        
        while current != nil {
            reversedList.push(current!.value)
            current = current?.next
        }
        
        return reversedList
    }
    
    //Books space efficient solution O(1) by pointing making the tail node the head and flipping the pointers
    //This implementation is a method inside of the LinkedList to mutate the list itself not an external function
    //Starting point
    // |head|                |tail|
    //   1    ->    2    ->    3   ->    nil
    //Step 1) assign tail to the head,
    //        create a prev variable that is assigned to head,
    //        create a current variable that is assigned to head.next
    //        assign prev.next to nil
    //|head|,|tail|,|prev|    |curr|
    //        1            ->   2    ->      3
    //Step 2) Loop through the linked list
    //        (Inside the Loop) Loop until current is nil
    //        keeping track of a third pointer called next
    //
    //        assign next to current.next
    //|head|,|tail|           |curr|       |next|
    //        1            ->   2    ->      3
    //|prev|
    //  1   ->  nil
    //       assign current.next to prev
    //|curr|       |prev|
    //  2      ->    1     ->  nil
    //       assign prev to current
    //|curr|,|prev|
    //      2        ->    1     ->  nil
    //       assign current to next to continue traversing the linked list
    //|curr|,|next|
    //      3        ->    nil
    //***Loop Back to Step 2***
    //***Loop Terminates***
    //Step 3) assign head to prev
    //|prev|,|head|                    |tail|
    //      3           ->    2    ->    1    ->   nil
    
    public func mergeLinkedLists<T: Comparable>(list1: LinkedList<T>, list2: LinkedList<T>) -> LinkedList<T>? {
        guard !list1.isEmpty || !list2.isEmpty else {
            if list1.isEmpty && !list2.isEmpty {
                return list2
            } else if !list1.isEmpty && list2.isEmpty {
                return list1
            } else {
                return nil
            }
        }
        
        var sortedList = LinkedList<T>()
        var l1pointer = list1.head
        var l2pointer = list2.head
        
        while l1pointer != nil || l2pointer != nil {
            if let l1Value = l1pointer?.value, let l2Value = l2pointer?.value {
                if l1Value <= l2Value {
                    sortedList.push(l1Value)
                    l1pointer = l1pointer?.next
                } else {
                    sortedList.push(l2Value)
                    l2pointer = l2pointer?.next
                }
            } else if l1pointer != nil {
                sortedList.push(l1pointer!.value)
                l1pointer = l1pointer?.next
            } else if l2pointer != nil {
                sortedList.push(l2pointer!.value)
                l2pointer = l2pointer?.next
            }
        }
        
        return reverseLinkedList(sortedList)
    }
    
    public func removeAllOccurences<T: Comparable>(of value: Int, from list: LinkedList<T>?) -> LinkedList<T>? {
        guard list?.head != nil else { return nil }
        
        var newList = LinkedList<T>()
        var curr = list?.head
        var prev = list?.head
        var next = curr?.next
        
        while curr != nil {
            if let val = curr?.value {
                if val as! Int == value {
                    prev!.next = next
                    prev = next
                } else {
                    prev = curr
                    newList.push(val)
                }
            }
            curr = curr?.next
            next = next?.next
        }
        
        return reverseLinkedList(newList)
    }
    
}

var sol = Solution()
var testList = LinkedList<Int>()
testList.push(1)
testList.push(2)
testList.push(1)
testList.push(5)
testList.push(1)
testList.push(4)
testList.push(1)

var testList2 = LinkedList<Int>()
testList2.push(6)
testList2.push(5)
testList2.push(0)

print(sol.reversePrintNodes(testList.head))
print(sol.findMiddleNode(testList)!.value)
print(sol.getMiddle(testList)!.value)
var answer = sol.reverseLinkedList(testList)!
print(sol.reversePrintNodes(answer.head))
print(sol.reversePrintNodes(sol.mergeLinkedLists(list1: testList, list2: testList2)?.head))
print(sol.reversePrintNodes(sol.removeAllOccurences(of: 1, from: testList)?.head))



