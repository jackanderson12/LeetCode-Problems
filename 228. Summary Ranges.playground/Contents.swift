import UIKit

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard nums != [] else { return [] }
        var currentRange: [Int] = []
        var answer: [String] = []
        for (index, value) in nums.enumerated() {
            if index <= nums.count - 2 {
                if value + 1 == nums[index + 1] {
                    currentRange.append(value)
                } else {
                    if index != 0 && value - 1 == nums[index - 1] {
                        currentRange.append(value)
                    } else {
                        answer.append("\(value)")
                    }
                    if currentRange.count > 1 {
                        answer.append("\(currentRange.first!)->\(currentRange.last!)")
                        currentRange.removeAll()
                    }
                }
            } else {
                currentRange.append(value)
            }
        }
        if currentRange.count > 1 {
            answer.append("\(currentRange.first!)->\(currentRange.last!)")
        } else {
            answer.append("\(currentRange.first!)")
        }
        return answer
    }
}

var sol = Solution()
var test = [0,1,2,4,5,7]
var answer = sol.summaryRanges(test)
print(answer)
