//
//  kthLargest.swift
//  SwiftTest
//
//  Created by shin jae ung on 2021/06/16.
//

import Foundation

func kthLargest(a: [Int], k: Int) -> Int? {
    let len = a.count
    guard k > 0 && k <= len else { return nil }
    let sorted = a.sorted()
    return sorted[len - k]
}

