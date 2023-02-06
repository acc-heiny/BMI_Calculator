//
//  BMIResultViewController.swift
//  DesafioIMC-2
//
//  Created by hellen.heiny.f.santi on 22/12/22.
//

import UIKit

class BMIResultViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var classificationLabel: UILabel!

    var bmiResult: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showResult()
    }
        
    private func setupValues(classification: String, imageName: String) {
        classificationLabel.text = classification
        resultImageView.image = UIImage(named: imageName)
    }
    
    private func showResult() {
    
        if bmiResult < 18.5 {
            setupValues(classification: "Baixo Peso", imageName: "Madruga")
        } else if bmiResult >= 18.5 && bmiResult <= 24.9 {
            setupValues(classification: "Peso Normal", imageName: "Pops")
        } else if bmiResult >= 25 && bmiResult <= 29.9 {
            setupValues(classification: "Obesidade", imageName: "Barriga")
        } else if bmiResult >= 30 && bmiResult <= 34.9 {
            setupValues(classification: "Obesidade grau |", imageName: "Barriga")
        } else if bmiResult >= 35 && bmiResult <= 39.9 {
            setupValues(classification: "Obesidade grau ||", imageName: "Barriga")
        } else if bmiResult >= 40 {
            setupValues(classification: "Obesidade grau |||", imageName: "Barriga")
        }
        valueLabel.text = String(format: "%.2f", bmiResult)
    }
    
}
