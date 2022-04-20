//
//  MoveToFront.swift
//  Created by hg on 20/04/2022.
//

import Foundation
import SwiftAlgorithms

class MoveToFront {
    
    private let radix: Int
    
    init() {
        self.radix = 128
    }
    
    func compress(_ string: String) -> Data {
        let rbt = LLRBT<Int,Character>()
        var charToKey = [Int]()
        
        for index in 0..<radix {
            let char = Character(UnicodeScalar(index)!)
            rbt.put(key: index, value: char)
            charToKey.append(index)
        }
        
        let builder = BinaryDataBuilder()
        
        for char in string {
            let asciiValue = Int(char.asciiValue!)
            let key = charToKey[asciiValue]
            let rank = rbt.rank(key: key)
            builder.append(rank, bitWidth: 8)
            
            rbt.delete(key: key)
            let newKey = rbt.min()!.key - 1
            charToKey[asciiValue] = newKey
            rbt.put(key: newKey, value: char)
        }
        
        return builder.getData()
    }
    
    func expand(data: Data) -> String {
        let rbt = LLRBT<Int,Character>()
        
        for index in 0..<radix {
            let char = Character(UnicodeScalar(index)!)
            rbt.put(key: index, value: char)
        }
        
        let reader = BinaryDataReader(data: data)
        var string = ""
        
        while let value = reader.readInt(bitWidth: 8) {
            let key = rbt.select(rank: value)!.key
            let char = rbt.get(key: key)!
            string.append(char)
            rbt.delete(key: key)
            let newKey = rbt.min()!.key - 1
            rbt.put(key: newKey, value: char)
        }
        
        return string
    }
    
}
