import SwiftUI

class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        var stack: [Character] = []
        for char in s {
            switch char {
            case "(":
                stack.append(")")
            case "[":
                stack.append("]")
            case "{":
                stack.append("}")
            default:
                if stack.isEmpty || stack.removeLast() != char {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

var sol = Solution()
var test = "([[()]])"
var answer = sol.isValid(test)
print(answer)
