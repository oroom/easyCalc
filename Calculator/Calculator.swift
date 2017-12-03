//
//  Calculator.swift
//  Calculator
//
//  Created by Евгений Таран on 11/27/17.
//  Copyright © 2017 Dzmitry Novak. All rights reserved.
//

import Foundation
enum CaclutorOperation {
    case plus
    case minus
    case sqrt
    case doublle
    case multiplie
    case division
    case plusMinus
    case sinus
    case cosinus
    case tangens
    case log
}

class Calculator {
    
    var result: Double?
    var inputValue: Double = 0
    var nextOperation: CaclutorOperation?
    
    func add(_ first: Double ,_ second: Double) -> Double{
        result = first + second
        return result!
    }
    func substract(_ first: Double , _ second: Double) -> Double{
        result = first - second
        return result!
    }
    func log(_ first: Double) -> Double{
        result = log2(first)
        return result!
    }
    func sqrtOf2(_ first: Double) -> Double{
        result = pow(first,(1/2))
        return result!
    }
    func sinus(_ first: Double) -> Double{
        result = sin(first * .pi / 180)
        return result!
    }
    func tangens(_ first: Double) -> Double{
        result = tan(first * .pi / 180)
        return result!
    }
    func cosinus(_ first: Double) -> Double{
        result = cos(first * .pi / 180)
        return result!
    }
    func doublled(_ first: Double) -> Double{
        result = pow(first,2)
        return result!
    }
    func multiplies(_ first: Double,_ second: Double) -> Double{
        result = first * second
        return result!
    }
    func divisions (_ first: Double,_ second: Double) -> Double{
        if second != 0 {
            result = first/second
        }
        else  {
            result = 0
        }
        return result!
    }
    func plusesMinus (_ first: Double) -> Double{
        if first > 0{
            result = -abs(first)
            return result!
        }
        else {
            result = abs(first)
            return result!
        }
        

    }
    func nextNumber(_ nextNumber: Double) -> Double{
        switch nextOperation!{
        case .plus:
            add(inputValue,nextNumber)
        case .minus:
            substract(inputValue, nextNumber)
        case .sqrt:
            sqrtOf2(inputValue)
        case .doublle:
            doublled(inputValue)
        case .multiplie:
            multiplies(inputValue, nextNumber)
        case .division:
            divisions(inputValue, nextNumber)
        case .plusMinus:
            plusesMinus(inputValue)
        case .sinus:
            sinus(inputValue)
        case .cosinus:
            cosinus(inputValue)
        case .tangens:
            tangens(inputValue)
        case .log:
            log(inputValue)
        }
        return result!
    }
    
}
