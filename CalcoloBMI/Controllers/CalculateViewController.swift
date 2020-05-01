//
//  ViewController.swift
//  CalcoloBMI
//
//  Created by Marouf, Zakaria on 01/05/2020.
//  Copyright © 2020 Marouf, Zakaria. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    // hegihtLabel, weightLabel, heightSlider, weightSlider
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderHandler(_ sender: UISlider) {
        let height = String(format: "%.1f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderHandler(_ sender: UISlider) {
        let weight = String(format: "%.1f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    @IBAction func calculateHandler(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "proceedToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "proceedToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

