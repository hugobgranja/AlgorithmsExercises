//
//  DutchNationalFlag.swift
//  AlgorithmsExercises
//  Created by hg on 17/10/2020.
//
//  Dutch national flag.
//  Given an array of n buckets, each containing a red, white, or blue pebble, sort them by color. The allowed operations are:
//  - swap(i, j): swap the pebble in bucket i with the pebble in bucket j.
//  - color(i): determine the color of the pebble in bucket i.
//  The performance requirements are as follows:
//  At most n calls to color().
//  At most n calls to swap().
//  Constant extra space.
//

import Foundation

enum Color: Int, Comparable {
    case red = 0
    case white = 1
    case blue = 2
    
    static func < (lhs: Color, rhs: Color) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct Pebble: Comparable {
    var color: Color
    
    static func < (lhs: Pebble, rhs: Pebble) -> Bool {
        return lhs.color < rhs.color
    }
    
}

struct Bucket: Comparable {
    var pebble: Pebble
    
    static func < (lhs: Bucket, rhs: Bucket) -> Bool {
        return lhs.pebble < rhs.pebble
    }
}

class DutchNationalFlag {
    
    func sort(_ buckets: inout [Bucket]) {
        var i = 0, j = 0
        var count = buckets.count - 1
        
        while i <= count {
            let color = buckets[i].pebble.color
            
            if color < .white {
                buckets.swapAt(i, j)
                i += 1
                j += 1
            }
            else if color > .white {
                buckets.swapAt(i, count)
                count -= 1
            }
            else {
                i += 1
            }
        }
    }
    
}
