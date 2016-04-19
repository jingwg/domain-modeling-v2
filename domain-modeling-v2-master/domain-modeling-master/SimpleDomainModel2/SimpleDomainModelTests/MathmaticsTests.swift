//
//  JobTests.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel2

class MathmaticsTests: XCTestCase {
    
    let tenUSD = Money(amount: 10, currency: "USD")
    let fiveGBP = Money(amount: 5, currency: "GBP")
    let fiveUSD = Money(amount: 5, currency: "USD")
 
func testAddMathmatics() {
        let total = tenUSD.addMoney(fiveGBP)
        XCTAssert(total.amount == 10)
        XCTAssert(total.currency == "GBP")
    }
    
  func testSubtractMathmatics() {
    let minusResult = fiveUSD.subtractMoney(tenUSD)
    XCTAssert(minusResult.amount == 5)
    XCTAssert(minusResult.currency == "USD")
    }
}
  
  


