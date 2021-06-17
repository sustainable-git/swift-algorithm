//
//  selectionSort.swift
//  SwiftTest
//
//  Created by shin jae ung on 2021/06/17.
//

import Foundation

func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    var arr = array
    
    for i in 0..<arr.count-1 {
        var lowest = i
        
        for j in i+1..<arr.count {
            if arr[j] < arr[lowest] {
                lowest = j
            }
        }
        
        if i != lowest {
            arr.swapAt(i, lowest)
        }
    }
    return arr
}
