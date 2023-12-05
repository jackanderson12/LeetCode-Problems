import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        return helper(node, 0)
    }
    func helper(_ root: TreeNode?,_ depth: Int) -> Int {
        guard root != nil else { return depth }
        return max(helper(root?.left, depth + 1), helper(root?.right, depth + 1))
    }
}

var sol = Solution()
var leftNode = TreeNode(2)
var rightNode2 = TreeNode(4)
var rightNode = TreeNode(3, nil, rightNode2)
var node1 = TreeNode(1, leftNode, rightNode)
var answer = sol.maxDepth(node1)
print(answer)
