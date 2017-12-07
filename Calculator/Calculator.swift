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
}

class Calculator {
    
    var result: Double = 0
    var inputValue: Double = 0
    var nextOperation: CaclutorOperation?
    
//    init(result: Double) {
//        self.result = result
//    }
    
    @discardableResult func add(_ first: Double, _ second: Double) -> Double {
        result = first + second
        return result
    }
    
    @discardableResult func substract(_ first: Double, _ second: Double) -> Double {
        result = first - second
        return result
    }
    
    @discardableResult func sqrtOf2(_ first: Double) -> Double {
        result = pow(first, (1/2))
        return result
    }
    
    @discardableResult func doublled(_ first: Double) -> Double {
        result = pow(first, 2)
        return result
    }
    
    @discardableResult func multiplies(_ first: Double, _ second: Double) -> Double {
        result = first * second
        return result
    }
    
    @discardableResult func divisions(_ first: Double, _ second: Double) -> Double {
        if second != 0 {
            result = first/second
        }
        else {
            result = 0
        }
        return result
    }
    
    @discardableResult func plusesMinus(_ first: Double) -> Double {
        if first > 0 {
            result = -abs(first)
            return result
        }
        else {
            result = abs(first)
            return result
        }
    }
    
    @discardableResult func nextNumber(_ nextNumber: Double) -> Double {
        if let nextOperation = nextOperation {
            switch nextOperation {
            case .plus:
                add(inputValue, nextNumber)
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
            }
            return result
        }
        else {
            return inputValue
        }
    }
}
