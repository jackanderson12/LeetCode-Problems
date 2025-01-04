import SwiftUI

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count <= haystack.count else { return -1 }
        
        var haystackArray = Array(haystack)
        var haystackPointer = 0
        var needleArray = Array(needle)
        var needlePointer = 0
        
        var testOccurance = 0
        var startingOccurance = -1
        
        while haystackPointer <= (haystack.count - 1) {
            if haystackArray[haystackPointer] == needleArray[needlePointer] {
                testOccurance = haystackPointer
                needlePointer += 1
                haystackPointer += 1
                if needlePointer == needle.count - 1 {
                    startingOccurance = testOccurance
                }
            } else {
                haystackPointer += 1
                needlePointer = 0
            }
        }
        
        return startingOccurance
    }
}

var sol = Solution()
var test1 = "hello"
var test2 = "ll"
var answer = sol.strStr(test1, test2)
print(answer)
