//
//  ExtentionDoubleTest.swift
//  SimpleDomainModel2
//
//  Created by chelseaGJW on 16/4/17.
//  Copyright © 2016年 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel2

class ExtentionDoubleTest: XCTestCase {

    func testUSD() {
        let twoUSD = 2.0.USD
        XCTAssert(twoUSD.amount == 2)
        XCTAssert(twoUSD.currency == "USD")
    }
    
    func testEUR() {
        let tenEUR = 20.0.EUR
        XCTAssert(tenEUR.amount == 20)
        XCTAssert(tenEUR.currency == "EUR")
    }
    
    func testGBP() {
        let sevenGBP = 7.0.GBP
        XCTAssert(sevenGBP.amount == 7)
        XCTAssert(sevenGBP.currency == "GBP")
    }
    
    func testYEN() {
        let nineCAN = 9.0.CAN
        XCTAssert(nineCAN.amount == 9)
        XCTAssert(nineCAN.currency == "CAN")
    }

}
