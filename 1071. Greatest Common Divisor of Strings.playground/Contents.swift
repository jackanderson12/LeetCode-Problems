import SwiftUI
import Foundation

class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str1 != "" else { return "" }
        guard str2 != "" else { return "" }
        var string1 = Array(str1)
        var string2 = Array(str2)
        var answer = ""
        if str1.contains(str2) {
            
        } else {
            
        }
        return answer
    }
}

var solution = Solution()
var test1 = "abcabc"
var test2 = "abc"
var answer = solution.gcdOfStrings(test1, test2)
print(answer)
