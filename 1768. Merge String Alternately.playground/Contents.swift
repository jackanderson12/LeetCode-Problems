import SwiftUI
import Foundation

class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        guard word1 != "" else { return word2 }
        guard word2 != "" else { return word1 }
        var merged = ""
        if word1.count >= word2.count {
            var shortword = Array(word2)
            var longword = Array(word1)
            for (index, value) in shortword.enumerated() {
                merged.append(longword[index])
                merged.append(value)
            }
            if word1.count != word2.count {
                var leftOvers = longword[shortword.count...longword.count - 1]
                for i in leftOvers {
                    merged.append(i)
                }
            }
        } else {
            var shortword = Array(word1)
            var longword = Array(word2)
            for (index, value) in shortword.enumerated() {
                merged.append(value)
                merged.append(longword[index])
            }
            if word1.count != word2.count {
                var leftOvers = longword[shortword.count...longword.count - 1]
                for i in leftOvers {
                    merged.append(i)
                }
            }
        }
        return merged
    }
}

var solution = Solution()
var test1 = "abc"
var test2 = "ba"
var answer = solution.mergeAlternately(test1, test2)
print(answer)
