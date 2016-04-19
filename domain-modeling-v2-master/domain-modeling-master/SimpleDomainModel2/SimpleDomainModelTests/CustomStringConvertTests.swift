//
//  MoneyTests.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel2

//////////////////
// MoneyTests
//
class CustomStringConvertTests: XCTestCase {
  
    func testMoneyDesc() {
        let tenUSD = Money(amount: 10, currency: "USD")
        XCTAssert(tenUSD.description() == "USD10.0")
    }
    
    func testJobDesc() {
        let job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        XCTAssert(job.description() == "Guest Lecturer Salary(1000)")
    }
    
    func testPersonDesc() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        XCTAssert(ted.description() == "Ted Neward  45 nil nil")
        
    }
    
    func testFamilyDesc() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        ted.job = Job(title: "Gues Lecturer", type: Job.JobType.Salary(1000))
        
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
        
        let family = Family(spouse1: ted, spouse2: charlotte)
        XCTAssert(family.description() == "Ted Neward, Charlotte Neward")
        
    }

}

