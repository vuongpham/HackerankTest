//
//  ViewController.swift
//  TestAlg
//
//  Created by Vuong on 2/6/20.
//  Copyright © 2020 Viet Tuan Dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let resultString = supperReduceString1(s: "baabcd")
        //let resultString = insertSort(s: [2,3,1])
          //  let result = binarySearchByiteratively(s: [1,3,4,5,8,10], x: 2)
        // let result = binarySearchByRecursively(s: [1,3,4,5,8,10], x: 2, left: 0, right: 6 - 1)
        let result = interpolationSearchByiteratively(s: [1,3,4,5,8,10], key: 10)
        print(result)
    }

// https://www.hackerrank.com/challenges/reduced-string/problem
    func supperReduceString(s: String) -> String {
        var result = ""
        
        var temp: Character? = nil
        for charactor in s {
            
            if temp == nil  {
              temp = charactor
               result.append(temp!)
                continue
            }
            
            if temp == charactor {
                temp = nil
                result.removeLast()
               continue
            }
            result.append(charactor)
            temp = charactor
        }
        
        if result == ""  {
            return "Empty String"
        } else if result == s {
            return result
        }
        
        return supperReduceString(s: result)
    }
    
    // Use stack's push-pop 
    func supperReduceString1(s: String) -> String {
        var stack = ""
        
        var temp: Character? = nil
        for charactor in s {
            
            // The first to run
            if temp == nil  {
               temp = charactor
               stack.append(temp!)
                continue
            }
            
            if temp == charactor {
                stack.removeLast()
                temp = stack.last
               continue
            }
            stack.append(charactor)
            temp = charactor
        }
        
        return stack
    }
}

extension ViewController {
    func insertSort(s: [Int]) -> [Int] {
        
        var result = s
        let sizeS = s.count
        
        for i in 1..<sizeS {
            let t = result[i]
            var preI = i - 1
            
            // If preValue bigger than value, i would move the value to after indet it bigger than.
            while preI >= 0 && result[preI] > t {
                result[preI+1] = result[preI]
                preI = preI - 1
            }
            
            // Insert
            result[preI + 1] = t
        }
        
        return result
    }
}

extension ViewController {
    // iteratively
    func binarySearchByiteratively(s: [Int], x: Int) -> Int? {
        var leftIndex = 0
        var rightIndex = s.count - 1
        
        while leftIndex <= rightIndex {
            let midIndex = (rightIndex + leftIndex ) / 2
            
            if x == s[midIndex] {
                return midIndex
            } else if x < s[midIndex] {
                rightIndex = midIndex - 1
            } else if x > s[midIndex] {
                leftIndex = midIndex + 1
            }
        }
        
        return nil
    }
    
    
    func binarySearchByRecursively(s: [Int], x: Int, left: Int, right: Int) -> Int? {
        if left > right {
            return nil
        }
        
        let mid = (right + left) / 2  // Other way adjust mid index: left + ((right - left )/2)
        
        if s[mid] == x {
            return mid
        } else if s[mid] > x {
            return binarySearchByRecursively(s: s, x: x, left: left, right: mid - 1)
        } else if s[mid] < x {
            return binarySearchByRecursively(s: s, x: x, left: mid + 1, right: right)
        }
        
        return nil
    }
}

extension ViewController {
    
    // Interpolation Search is improve binary search via mid = left + ((key - s[left]) * (right - left) / (s[right] - s[left]));
    //
    func interpolationSearchByiteratively(s: [Int], key: Int) -> Int? {
        var left = 0
        var right = s.count - 1
        
        while left <= right {
            let mid = left + ((key - s[left]) * (right - left) / (s[right] - s[left]));
            
            if key == s[mid] {
                return mid
            } else if key < s[mid] {
                right = mid - 1
            } else if key > s[mid] {
                left = mid + 1
            }
        }
        
        return nil
    }

}
