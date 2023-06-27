import UIKit

class ResultViewController: UIViewController {
    

    var bmiResultView: BMIResultView
    var bmiResultModel: ShowResultModel
    
    init(bmiResultCalculated: Double){
        bmiResultModel = ShowResultModel(bmiResult: bmiResultCalculated)
        bmiResultView = BMIResultView(setup: bmiResultModel.setup, bmiResult: bmiResultCalculated)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        self.view = bmiResultView
    }
    override func viewDidLoad() {
        navigationItem.title = "Resultado IMC"
    }
}
