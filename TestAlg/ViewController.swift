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
        //print(bigSorting(unsorted: ["11111112398234820348230420340","3","4","5","2398234820348230420340"]))
        
        //let resultString = supperReduceString1(s: "baabcd")
        let resultString = insertSort(s: [2,3,1])
        
        print(resultString)
    }
    
    func bigSorting(unsorted: [String]) -> [String] {
        let  result = unsorted
        quickSort(arr: result, low: 0, hight: result.count - 1)
        return result
    }
    
    func quickSort(arr: [String], low: Int, hight: Int) {
        if low < hight {
            
        }
    }
    
    func findPivotIndex(arr: [String], low: Int, high: Int) -> Int{
        
        let pivot = arr[high];
        let i = low - 1
        
        
        return 0
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
        var i: Int = 0
        
        while i < result.count - 1 {
            let value = result[i]
            var nextIndex = i + 1
            if value > result[nextIndex]{
                
                while nextIndex < i {
                    result[nextIndex] = result[nextIndex - 1]
                    nextIndex = nextIndex - 1
                }
            }
            
            i = i + 1

        }
        
        return result
    }
}

