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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard var bNode = root else { return nil }
        
        //recursively visit the left side
        var leftSideSwap = invertTree(bNode.left)
        //recursively visit the right side
        var rightSideSwap = invertTree(bNode.right)
        
        //swap left and right side
        bNode.left = rightSideSwap
        bNode.right = leftSideSwap
        
        return bNode
    }
}

var sol = Solution()
var root = TreeNode(1, TreeNode(2), TreeNode(3))
root = sol.invertTree(root)!
print("root val: \(root.val), left val: \(root.left?.val ?? -1), right val: \(root.right?.val ?? -1)")


