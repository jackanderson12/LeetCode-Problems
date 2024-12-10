import UIKit

/*
 Base Case [0], n=1, should place flower, [1], should not place flower
 Easy Case [0,0], n=1, should place flower, [1,0], should not place flower
 
 Tough Scenarios
 -> Flower at the beginning of array
 -> Flower at the end of array
 
 */

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n <= 0 || n > flowerbed.count {
            return false
        }
        var flowersToPlace: Int = n
        var firstZero: Bool = false
        for i in 0..<flowerbed.count {
            if flowerbed[i] == 0 {
                switch i {
                case 0:
                    if flowerbed.count > 1 {
                        if flowerbed[i+1] == 0 {
                            flowersToPlace -= 1
                            firstZero = false
                        } else {
                            firstZero = true
                        }
                    } else {
                        flowersToPlace -= 1
                    }
                case 1..<flowerbed.count - 1:
                    if firstZero && flowerbed[i+1] == 0 {
                        flowersToPlace -= 1
                        firstZero = false
                    } else {
                        firstZero = true
                    }
                case flowerbed.count - 1:
                    if firstZero {
                        flowersToPlace -= 1
                        firstZero = false
                    }
                default:
                    firstZero = true
                }
            } else {
                firstZero = true
            }
        }
        if flowersToPlace == 0 {
            return true
        } else {
            return false
        }
    }
}

var sol = Solution()
var nTest: Int = 2
var arrrayTest1: [Int] = [1,0,0,0,0,1]
var result = sol.canPlaceFlowers(arrrayTest1, nTest)
print(result)
