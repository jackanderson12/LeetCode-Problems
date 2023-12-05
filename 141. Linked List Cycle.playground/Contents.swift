import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        gu
    }
}

var sol = Solution()
var test = ListNode(0)
var test1 = ListNode(1)
test.next = test1
test1.next = test
var answer = sol.hasCycle(test)
print(answer)
