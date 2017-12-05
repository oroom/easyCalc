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
    
    func add(_ first: Double, _ second: Double) -> Double {
        result = first + second
        if let result = result {
        return result
        }
        else {
            return 0
        }
    }
    func substract(_ first: Double, _ second: Double) -> Double {
        result = first - second
        if let result = result {
            return result
        }
        else {
            return 0
        }
    }
    func sqrtOf2(_ first: Double) -> Double {
        result = pow(first, (1/2))
        if let result = result {
            return result
        }
        else {
            return 0
        }
    }
    func doublled(_ first: Double) -> Double {
        result = pow(first, 2)
        if let result = result {
            return result
        }
        else {
            return 0
        }
    }
    func multiplies(_ first: Double, _ second: Double) -> Double {
        result = first * second
        if let result = result {
            return result
        }
        else {
            return 0
        }
    }
    func divisions (_ first: Double, _ second: Double) -> Double {
        if second != 0 {
            result = first/second
        }
        else {
            result = 0
        }
        if let result = result {
            return result
        }
        else {
            return 0
        }
    }
    func plusesMinus (_ first: Double) -> Double {
        if first > 0{
            result = -abs(first)
            if let result = result {
                return result
            }
            else {
                return 0
            }
        }
        else {
            result = abs(first)
            if let result = result {
                return result
            }
            else {
                return 0
            }
        }
    }
    func nextNumber(_ nextNumber: Double) -> Double {
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
