import UIKit

//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000

//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.

//Thought process: Dictionary to lookup values. Need current value and next value.
//                 If the current value is less than next value, check for one
//                 of the special cases defined above. Loop through and have a running sum.

class Solution {
    func romanToInt(_ s: String) -> Int {
        var array = Array(s)
        var romanLookUp: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100,
                                         "D": 500, "M": 1000]
        var runningTotal = 0
        
        for (position, value) in array.enumerated() {
            if position + 1 < array.count {
                if romanLookUp[String(value)]! < romanLookUp[String(array[position + 1])]! {
                    var test = String(value) + String(array[position + 1])
                    switch test {
                    case "IV":
                        runningTotal += 4
                    case "IX":
                        runningTotal += 9
                    case "XL":
                        runningTotal += 40
                    case "XC":
                        runningTotal += 90
                    case "CD":
                        runningTotal += 400
                    case "CM":
                        runningTotal += 900
                    default:
                        break
                    }
                    runningTotal -= romanLookUp[String(array[position + 1])]!
                } else {
                    runningTotal += romanLookUp[String(value)]!
                }
            } else {
                runningTotal += romanLookUp[String(value)]!
            }
        }
        return runningTotal
    }
}

var solution = Solution()
var testCase = "MCDXLVI"
var answer = solution.romanToInt(testCase)
print(answer)

