import UIKit

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var numSet = Set(nums)
        var index = 0
        var dupCount = 1
        while index <= nums.count - 1 {
            if index != 0 && nums[index] == nums[index - 1] {
                dupCount += 1
            } else if index != 0 && nums[index] != nums[index - 1] {
                dupCount = 1
            }
            if numSet.contains(nums[index]) && dupCount > 2 {
                nums.remove(at: index)
                index -= 1
            }
            index += 1
        }
        return nums.count
    }
}

var sol = Solution()
var test = [0,0,0,1,1,1,1,2,2,2,2]
var answer = sol.removeDuplicates(&test)
print(test)
print(answer)
