import UIKit

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magDict: [Character:Int] = [:]
        for i in magazine {
            if magDict.keys.contains(i) {
                magDict[i]! += 1
            } else {
                magDict[i] = 1
            }
        }
        for i in ransomNote {
            if magDict.keys.contains(i) {
                magDict[i]! -= 1
                if magDict[i]! < 0 {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
}

var sol = Solution()
var test = "aa"
var mag = "aab"
var answer = sol.canConstruct(test, mag)
print(answer)
