//
//  BmiViewController.swift
//  DesafioIMC-2
//
//  Created by hellen.heiny.f.santi on 16/12/22.
//

import UIKit

class BmiViewController: UIViewController {
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    private var bmiResult: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BMIResult",
           let viewController: BMIResultViewController = segue.destination as? BMIResultViewController {
   
            viewController.bmiResult = bmiResult
        }
    }
    
    private func setupViews() {
        setupTextField(textField: weightTextField)
        setupTextField(textField: heightTextField)
        setupButton(button: calculateButton)
    }
    
    private func setupTextField(textField: UITextField) {
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.masksToBounds = true
    }

    private func setupButton(button: UIButton) {
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
    }
    
    @IBAction private func calculate(_ sender: UIButton) {
        if let heightText = heightTextField.text,
           let heightDouble = Double(heightText),
           let weightText = weightTextField.text,
           let weightDouble = Double(weightText) {
            
            bmiResult = weightDouble / (heightDouble * heightDouble) * 10000
        }
    }
    
}
