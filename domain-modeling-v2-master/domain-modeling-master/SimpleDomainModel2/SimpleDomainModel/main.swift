//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

public class TestMe {
  public func Please() -> String {
    return "I have been tested"
  }
    
}

protocol CustomStringCovert {
    func description() -> String
    
}



protocol Mathmatics {
    func addMoney(A: Money) -> Money
    func subtractMoney(from: Money) -> Money
}
////////////////////////////////////
// Money
//
public struct Money: CustomStringCovert, Mathmatics {
    public var amount : Int
    public var currency : String
    
    init (){
        self.amount = 0
        self.currency = ""
    }
    
    init(amount: Int, currency: String){
        self.amount = amount
        self.currency = currency
    }
    
    private func rate(A: String, toB : String) -> Double{
        var rateA = 0.0
        var rateB = 0.0
        if (A == "USD") {
            rateA = 1.0
        }
        if(A == "GBP"){
            rateA = 0.5
        }
        if(A == "EUR"){
            rateA = 1.5
        }
        if(A == "CAN"){
            rateA = 1.25
        }
        if (toB == "USD") {
            rateB = 1.0
        }
        if( toB == "GBP"){
            rateB = 0.5
        }
        if(toB == "EUR"){
            rateB = 1.5
        }
        if(toB == "CAN"){
            rateB = 1.25
        }
        return rateB / rateA
    }
    
    public func convert(to: String) -> Money {
        switch to {
        case "USD" : return Money(amount: Int(Double(self.amount) * rate(self.currency, toB:to)), currency: "USD")
        case "CAN" : return Money(amount: Int(Double(self.amount) * rate(self.currency, toB:to)), currency:"CAN")
        case "EUR" : return Money(amount: Int(Double(self.amount) * rate(self.currency, toB:to)), currency: "EUR")
        case "GBP" : return Money(amount: Int(Double(self.amount) * rate(self.currency, toB:to)), currency: "GBP")
        default: return Money(amount: self.amount, currency: self.currency)
        }
    }
    
    
  /*  public func add(to: Money) -> Money {
        var selfM = 0
        if(self.currency != to.currency){
            selfM = self.convert(to.currency).amount
        }else{
            selfM = self.amount
        }
        return Money(amount: selfM + to.amount, currency: to.currency)
    }
    
    public func subtract(from: Money) -> Money {
        var selfM = 0
        if(self.currency != from.currency){
            selfM = self.convert(from.currency).amount
        }else{
            selfM = self.amount
        }
        return Money(amount: from.amount - selfM, currency: from.currency)
    }
 */
    
    public func description() -> String {
        
        return  currency + "\(Double(amount))"
    }
    
    public func addMoney(A: Money) -> Money {
    
        var selfM = 0
        if(self.currency != A.currency){
            selfM = self.convert(A.currency).amount
        }else{
            selfM = self.amount
        }
        return Money(amount: selfM + A.amount, currency: A.currency)
    }
 
    
    public func subtractMoney(from: Money) -> Money {
        var selfM = 0
        if(self.currency != from.currency){
            selfM = self.convert(from.currency).amount
        }else{
            selfM = self.amount
        }
        return Money(amount: from.amount - selfM, currency: from.currency)
    }
    
}

extension Double {
    var USD : Money {return Money(amount: Int(self), currency: "USD")}
    var EUR : Money {return Money(amount: Int(self), currency: "EUR")}
    var GBP : Money {return Money(amount: Int(self), currency: "GBP")}
    var CAN : Money {return Money(amount: Int(self), currency: "CAN")}

   }

////////////////////////////////////
// Job
//
public class Job: CustomStringCovert {
    public var title : String
    public var jobtype: JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    public init(title : String, type : JobType) {
        self.title = title
        self.jobtype = type
    }
    
    public func calculateIncome(hours: Int) -> Int {
        switch self.jobtype {
        case let .Hourly(rate) : return Int(Double(hours) * rate)
        case let .Salary(total): return total
        }
    }
    
    public func raise(amt : Double) {
        switch self.jobtype {
        case let .Hourly(rate): self.jobtype = .Hourly(amt + rate)
        case let .Salary(total): self.jobtype = .Salary(Int(amt) + total)
        }
    }
  
    public func description() -> String {
        
        return title + " \(String(jobtype))"
    }
}


    


////////////////////////////////////
// Person
//
public class Person: CustomStringCovert {
    public var firstName : String = ""
    public var lastName : String = ""
    public var age : Int = 0
    private var _job : Job? = nil
    private var _spouse : Person? = nil
    
    public var job : Job? {
        get {
            return self._job}
        set(newjob) {
            if (self.age) >= 16 {
                self._job = newjob
            }
        }
    }
    
    public var spouse : Person? {
        get {
            return self._spouse
        }
        set(newPerson) {
            if (self.age) >= 18 {
                self._spouse = newPerson
            }
        }
    }
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    public func toString() -> String {
        return "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(job) spouse:\(spouse)]"
    }
    
    public func description() -> String {
        return firstName + " \(lastName)  \(age) \(job?.title) \(spouse)"
    }
    
}



////////////////////////////////////
// Family
//
public class Family: CustomStringCovert {
    private var members : [Person] = []
    
    public init(spouse1: Person, spouse2: Person) {
        if(spouse1.spouse == nil && spouse2.spouse == nil){
            self.members = [spouse1, spouse2]
        }
    }
    
    public func haveChild(child: Person) -> Bool {
        var  check = false
        for person in members{
            if person.age > 21{
                check = true
            }
        }
        if(check) {
            members.append(child)
        }
        return check
    }
    
    
    public func householdIncome() -> Int {
        var householdIncome = 0
        for person in members {
            if person.job != nil {
                householdIncome = householdIncome + person.job!.calculateIncome(2000)
            }
        }
        return householdIncome
    }
    
    public func description() -> String {
        var result = ""
        var num = 0
        while (num < (members.count - 1)) {
            result += "\(members[num].firstName) \(members[num].lastName), "
            num = num + 1
        }
        result = result + "\(members[num].firstName) \(members[num].lastName)"
        return result
    }
    
}








