import UIKit

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k > 0 {
            nums.insert(nums.last!, at: 0)
            nums.removeLast()
        }
        if k - 1 > 0 {
            rotate(&nums, k - 1)
        }
    }
}

var sol = Solution()
var test = [0,1,2,3]
var intToTest = 2
sol.rotate(&test, intToTest)
print(test)
