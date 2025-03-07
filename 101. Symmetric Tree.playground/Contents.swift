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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard var bNode = root else { return true }
        if bNode.left?.val != bNode.right?.val {
            return false
        }
        return symmetricTest(bNode.left, bNode.right)
    }
    func symmetricTest(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
        guard var left = leftNode, var right = rightNode else { return true }
        //Compare the mirrored sides and if not equal return false
        if left.left?.val != right.right?.val || left.right?.val != right.left?.val {
            return false
        } else {
            //recursively call the function on the corresponding sides
            return symmetricTest(left.left, right.right) && symmetricTest(left.right, right.left)
        }
    }
}

var sol = Solution()
var root = TreeNode(1, TreeNode(2), TreeNode(2))
var test = sol.isSymmetric(root)
print(test)
