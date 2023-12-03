import UIKit

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var test = s.filter { $0.isLetter || $0.isNumber }
        test = test.lowercased()
        var duplicate = String(test.reversed())
        if test == duplicate {
            return true
        } else {
            return false
        }
    }
}

var sol = Solution()
var test = "A man, a plan, a canal: Panama"
var answer = sol.isPalindrome(test)
print(answer)
