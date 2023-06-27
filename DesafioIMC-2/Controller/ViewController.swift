import UIKit
import Foundation

class ViewController: UIViewController {
    
    var calculateResultModel: CalculateResultModel = CalculateResultModel()
    var bmiView: BMIView = BMIView()
    
    override func loadView() {
        bmiView.delegate = self
        self.view = bmiView
    }
}

extension ViewController: BMIViewDelegate {
    
    func openBMIResultScreen(weightText: String, heightText: String) {
        
        if let heightDoubleResult = Double(heightText),
           let weightDoubleResult = Double(weightText) {
            let bmiResultCalculated: Double =  calculateResultModel.calculateResultIMC(weight: weightDoubleResult, height: heightDoubleResult)
            
            let BMIResultViewController: ResultViewController = ResultViewController(bmiResultCalculated: bmiResultCalculated)
            navigationController?.pushViewController(BMIResultViewController, animated: true)
        }
    }

}
