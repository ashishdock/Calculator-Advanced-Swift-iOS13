//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ashish Sharma on 12/20/2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            }
            else if symbol == "AC" {
                return 0
            }
            else if symbol == "%" {
                return n * 0.01
            }
            else if symbol == "=" {
                return performTwoNumCalculation(n2: n)
            }
            else {
                print("Reached intermediateCalculation...")
                intermediateCalculation = (n1: n, calcMethod: symbol)
                print(intermediateCalculation?.n1,intermediateCalculation?.calcMethod)
            }
            

        }
        
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                print("hit +")
                return n1 + n2
            case "-":
                print("hit -")
                return n1 - n2
            case "×":
                print("hit *")
                return n1 * n2
            case "÷":
                print("hit /")
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
