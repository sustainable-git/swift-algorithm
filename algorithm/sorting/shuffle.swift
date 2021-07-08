//
//  shuffle.swift
//  SwiftTest
//
//  Created by shin jae ung on 2021/07/08.
//

import Foundation

extension Array {
    public mutating func shuffle() {
        var temp = [Element]()
        while !isEmpty {
            let index = count.arc4ramdom
            let object = remove(at: index)
            temp.append(object)
        }
        self = temp
    }
}

extension Int {
    var arc4ramdom : Int {
        if self > 0 { return Int(arc4random_uniform(UInt32(self))) }
        else { return -Int(arc4random_uniform(UInt32(-self))) }
    }
}
