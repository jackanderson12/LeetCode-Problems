import UIKit

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
// This solution works but is too slow
//        var prevProfit = 0
//        var currentProfit = 0
//        var min = 0
//        var max = 1
//        while min <= prices.count {
//            if max < prices.count && min != max {
//                currentProfit = prices[max] - prices[min]
//                if currentProfit > prevProfit {
//                    prevProfit = currentProfit
//                }
//                max += 1
//            } else {
//                min += 1
//                max = min + 1
//            }
//        }
//        if currentProfit >= prevProfit && currentProfit >= 0 {
//            return currentProfit
//        } else if prevProfit > currentProfit && prevProfit > 0 {
//            return prevProfit
//        } else {
//            return 0
//        }
        var minimum = Int.max
        var profit = 0
        for price in prices {
            minimum = min(minimum, price)
            profit = max(profit, (price - minimum))
        }
        return profit
    }
}

var sol = Solution()
var testArray = [7,1,5,3,6,4]
sol.maxProfit(testArray)
var test2Array = [7,6,5,4,3,2]
sol.maxProfit(test2Array)
