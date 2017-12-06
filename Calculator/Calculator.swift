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
    
    var result: Double?
    var inputValue: Double = 0
    var nextOperation: CaclutorOperation?
    
    @discardableResult func add(_ first: Double, _ second: Double) -> Double {
        let output = first + second
        result = output
        return output
    }
    
    @discardableResult func substract(_ first: Double, _ second: Double) -> Double {
        let output = first - second
        result = output
        return output
    }
    
    @discardableResult func sqrtOf2(_ first: Double) -> Double {
        let output = pow(first, (1/2))
        result = output
        return output
    }
    
    @discardableResult func doublled(_ first: Double) -> Double {
        let output = pow(first, 2)
        result = output
        return output
    }
    
    @discardableResult func multiplies(_ first: Double, _ second: Double) -> Double {
        let output = first * second
        result = output
        return output
    }
    
    @discardableResult func divisions(_ first: Double, _ second: Double) -> Double {
        var output: Double
        if second != 0 {
            output = first/second
        }
        else {
            output = 0
        }
        result = output
        return output
    }
    
    @discardableResult func plusesMinus(_ first: Double) -> Double {
        var output: Double
        if first > 0 {
            output = -abs(first)
            result = output
            return output
        }
        else {
            output = abs(first)
            result = output
            return output
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
            if let result = result {
                return result
            }
            else {
                return 0
            }
        }
        else {
            return inputValue
        }
    }
}
