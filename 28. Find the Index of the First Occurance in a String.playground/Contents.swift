import SwiftUI

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count < haystack.count else { return -1 }
        if !haystack.contains(needle) {
            return -1
        } else {
            var startWindow = 0
            var endWindow = (haystack.count - needle.count) - 1
            var arrHay = Array(haystack)
            while endWindow < arrHay.count {
                var arrNeed = Array(needle)
                for i in arrHay[startWindow..<endWindow] {
                    if i == arrNeed[0] {
                        arrNeed = Array(arrNeed.dropFirst())
                    }
                }
                if arrNeed.isEmpty {
                    return startWindow
                } else {
                    startWindow += 1
                    endWindow += 1
                }
            }
        }
        return -1
    }
}

var sol = Solution()
var test1 = "hello"
var test2 = "ll"
var answer = sol.strStr(test1, test2)
print(answer)
