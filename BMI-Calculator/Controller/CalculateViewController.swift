//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Yas Garza on 30/12/22.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var selectedHeightLabel: UILabel!
    @IBOutlet weak var selectedWeightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorLogic = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSlideChanged(_ sender: UISlider) {
        selectedHeightLabel.text = "\(round(sender.value * 100) / 100)m"
    }
    
    @IBAction func weightSlideChanged(_ sender: UISlider) {
        selectedWeightLabel.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = round(heightSlider.value * 100) / 100
        let weight = round(weightSlider.value)
        
        calculatorLogic.calculateBMI(height, weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.bmiValue = calculatorLogic.getBMI()
        destinationVC.advice = calculatorLogic.getAdvice()
        destinationVC.color = calculatorLogic.getColor()
    }
}

