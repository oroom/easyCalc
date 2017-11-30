//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Admin on 27.11.17.
//  Copyright © 2017 Dzmitry Novak. All rights reserved.
//

import Foundation

enum Operation{
    case addition
    case substract
    case multi
}

class Calculator{
    var result: Int?
    var inputValue: Int = 0
    var operation: Operation?
    
    func nextNumber (_ nextNumber: Int) -> Int {
        if let operation = operation{
        switch operation {
        case .addition:
            result = addition (inputValue, nextNumber)
        case .substract:
            result = substract (inputValue, nextNumber)
        case .multi:
            result = multi (inputValue,nextNumber)
        }
        return result!
    }
        else {
            return inputValue
        }
    }
    
    
    
    func addition (_ firstNumber: Int,_ nextNumber: Int) -> Int {
        result = firstNumber + nextNumber
        return  result!
    }
    
    
    func substract (_ firstNumber: Int,_ nextNumber: Int) -> Int {
        result = firstNumber - nextNumber
        return result!
    }
    
    
    func multi (_ firstNumber: Int,_ nextNumber: Int) -> Int {
        result = firstNumber * nextNumber
        return result!
    }
}

