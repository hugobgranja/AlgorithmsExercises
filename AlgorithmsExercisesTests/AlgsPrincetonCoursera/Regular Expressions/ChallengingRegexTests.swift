//
//  ChallengingRegexTests.swift
//  AlgorithmsExercises
//  Created by hg on 14/04/2022.
//

import XCTest

class ChallengingRegexTests: XCTestCase {
    
    var sut: ChallengingRegex!
    
    override func setUp() {
        super.setUp()
        sut = ChallengingRegex()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testOne() {
        let regex = sut.one()
        
        for number in 0..<64 where number != 3 && number != 7 {
            let binary = String(number, radix: 2)
            let recognizes = binary.range(of: regex, options: .regularExpression) != nil
            XCTAssertTrue(recognizes)
        }
        
        XCTAssertNil("11".range(of: regex, options: .regularExpression))
        XCTAssertNil("111".range(of: regex, options: .regularExpression))
    }
    
    func testTwo() {
        let regex = sut.two()
        
        for number in 0..<64 {
            let binary = String(number, radix: 2)
            
            let isValid = binary
                .reversed()
                .enumerated()
                .reversed()
                .filter { (index, _) in !index.isMultiple(of: 2) }
                .allSatisfy { (_, bit) in bit == "1"}
            
            let recognizes = binary.range(of: regex, options: .regularExpression) != nil
            
            XCTAssertEqual(isValid, recognizes)
        }
    }
    
    func testFour() {
        let regex = sut.four()
        
        for number in 0..<64 {
            let binary = String(number, radix: 2)
            let zeroCount = binary.filter { $0 == "0" }.count
            let oneCount = binary.filter { $0 == "1" }.count
            let isValid = zeroCount >= 2 && oneCount == 1
            let recognizes = binary.range(of: regex, options: .regularExpression) != nil
            XCTAssertEqual(isValid, recognizes)
        }
    }
    
    func testFive() {
        let regex = sut.five()
        
        for number in 0..<64 {
            let binary = String(number, radix: 2)
            let isValid = number.isMultiple(of: 3)
            let recognizes = binary.range(of: regex, options: .regularExpression) != nil
            
            if isValid != recognizes {
                fatalError()
            }
            
            XCTAssertEqual(isValid, recognizes)
        }
    }
    
    func testSix() {
        let regex = sut.six()
        
        for number in 0..<64 {
            let binary = String(number, radix: 2)
            let isValid = !binary.contains("11")
            let recognizes = binary.range(of: regex, options: .regularExpression) != nil
            XCTAssertEqual(isValid, recognizes)
        }
    }
    
    func testEight() {
        let regex = sut.eight()
        
        for number in 0..<1024 {
            let binary = String(number, radix: 2)
            let zeroOneCount = binary.components(separatedBy: "01").count - 1
            let oneZeroCount = binary.components(separatedBy: "10").count - 1
            let isValid = zeroOneCount == oneZeroCount
            let recognizes = binary.range(of: regex, options: .regularExpression) != nil
            XCTAssertEqual(isValid, recognizes)
        }
    }
    
}
