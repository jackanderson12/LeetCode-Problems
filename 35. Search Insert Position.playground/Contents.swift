import SwiftUI
import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var middleIndex = nums.count / 2
        var expectedIndex = 0
        
        if target == nums[middleIndex] {
            return middleIndex
        } else if target < nums[middleIndex] {
            for index in 0...middleIndex {
                if nums[index] == target {
                    return index
                } else if nums[index] > target {
                    return index
                }
            }
            return middleIndex
        } else {
            for index in middleIndex...nums.count - 1 {
                if nums[index] == target {
                    return index
                } else if nums[index] > target {
                    return index
                }
            }
            return nums.count
        }
    }
}

var sol = Solution()
var arrayTest = [1]
var targetTest = 0
var answer = sol.searchInsert(arrayTest, targetTest)
print(answer)
