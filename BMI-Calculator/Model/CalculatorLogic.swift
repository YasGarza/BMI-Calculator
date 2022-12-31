//
//  CalculatorLogic.swift
//  BMI-Calculator
//
//  Created by Yas Garza on 31/12/22.
//

import UIKit

struct CalculatorLogic {
    
    var bmiCalculated: BMI?
    
    mutating func calculateBMI(_ height: Float, _ weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        switch bmiValue {
        case ..<18.5:
            bmiCalculated = BMI(value: bmiValue, advice: "Eat more pies!", color: nil)
        case 18.5...24.9:
            bmiCalculated = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor(red: 0.76, green: 1.00, blue: 0.60, alpha: 1.00))
        default:
            bmiCalculated = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor(red: 0.84, green: 0.49, blue: 0.24, alpha: 1.00))
        }
    }
    
    func getBMI() -> String {
        return String(format: "%.1f", bmiCalculated?.value ?? 0.0)
    }
    
    func getAdvice() -> String? {
        return bmiCalculated?.advice
    }
    
    func getColor() -> UIColor? {
        return bmiCalculated?.color
    }
}
