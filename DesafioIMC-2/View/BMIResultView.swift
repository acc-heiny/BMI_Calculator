import UIKit
import SnapKit

class BMIResultView: UIView {
    
    init(setup: BMIResultSetup, bmiResult: Double) {
        
        super.init(frame: .zero)
        setupView()
        valueLabel.text = String(format: "%.2f", bmiResult)
        resultImage.image = UIImage(named: setup.imageName)
        classificationLabel.text = setup.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var valueLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = ""
        title.font = UIFont(name: "Futura", size: 48)
        title.textColor = .black
        title.textAlignment = .center
        return title
    }()
    
    
    lazy var resultImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var classificationLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = ""
        title.font = UIFont(name: "Futura", size: 30)
        title.textColor = .black
        title.textAlignment = .center
        return title
        
    }()
    
}

extension BMIResultView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(valueLabel)
        addSubview(resultImage)
        addSubview(classificationLabel)
    }
    
    func setupConstraints() {
        valueLabel.snp.makeConstraints { make in
            make.width.equalTo(147)
            make.height.equalTo(106)
            make.leading.equalTo(139)
            make.top.equalTo(176)
        }
        
        resultImage.snp.makeConstraints { make in
            make.width.equalTo(195)
            make.height.equalTo(347)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        classificationLabel.snp.makeConstraints {make in
            make.width.equalTo(283)
            make.height.equalTo(186)
            make.leading.equalTo(73)
            make.top.equalTo(resultImage.snp.bottom).offset(75)
        }
    }
    
    func setupConfiguration() {
        backgroundColor = .white
    }
}
