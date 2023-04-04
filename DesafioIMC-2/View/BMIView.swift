import SnapKit
import UIKit

protocol BMIViewDelegate: AnyObject {
    func openBMIResultScreen(weightText: String, heightText: String)
}

class BMIView: UIView {
    
    var textFieldView = TextFieldView()
    weak var delegate: BMIViewDelegate?
    
    lazy var backgroundImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background-Chaves")
        image.backgroundColor = UIColor(white: 1, alpha: 0.75)
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var titleBMICalculator: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = "Calculadora IMC"
        title.font = UIFont(name: "Futura-Bold", size: 40)
        title.textColor = .blue
        title.textAlignment = .center
        return title
    }()
    
    lazy var textFieldContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .equalCentering
        view.spacing = 4
        return view
    }()
    
    lazy var calculateIMCButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.setTitle("Calcular IMC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(calculateButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func calculateButton() {
        
        if let heightText  = textFieldView.heightTextField.text,
           let weightText = textFieldView.weightTextField.text {
            delegate?.openBMIResultScreen(weightText: weightText, heightText: heightText)
        }
    }
    
}

extension BMIView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(backgroundImage)
        addSubview(titleBMICalculator)
        textFieldContainer.addArrangedSubview(textFieldView)
        addSubview(textFieldContainer)
        addSubview(calculateIMCButton)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
        titleBMICalculator.snp.makeConstraints { make in
            make.width.equalTo(353)
            make.height.equalTo(53)
            make.leading.equalTo(38).offset(20)
            make.trailing.equalTo(38).inset(20)
            make.top.equalTo(413)
        }
        
        textFieldContainer.snp.makeConstraints { make in
            make.top.equalTo(80)
            make.bottom.equalTo(80)
            make.leading.trailing.equalTo(54).inset(20)
        }
        
        calculateIMCButton.snp.makeConstraints { make in
            make.width.equalTo(322)
            make.height.equalTo(45)
            make.trailing.equalTo(54).inset(20)
            make.leading.equalTo(54).inset(20)
            make.top.equalTo(863)
            
        }
    }
    
    func setupConfiguration() {
        //
    }
}


