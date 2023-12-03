import UIKit

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if t.contains(s) {
            return true
        }
        for i in s {
            if !t.contains(i) {
                return false
            }
            for j in t {
                if i == j {
                    //record position
                }
            }
        }
        return true
    }
}

var sol = Solution()
var testString1 = "ab"
var testString2 = "baabcdef"
var answer = sol.isSubsequence(testString1, testString2)
print(answer)
