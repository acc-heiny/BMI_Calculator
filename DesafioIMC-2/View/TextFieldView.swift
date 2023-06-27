import UIKit
import SnapKit

class TextFieldView: UIView {
    
    lazy var titleWeight: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = "Peso"
        title.font = UIFont(name: "Futura-Bold", size: 20)
        title.textColor = .black
        title.textAlignment = .left
        return title
    }()
    
    lazy var weightTextField: UITextField = {
        let title = UITextField(frame: .zero)
        title.keyboardType = .numberPad
        title.placeholder = "40,00"
        title.borderStyle = .roundedRect
        title.font = UIFont.systemFont(ofSize: 20)
        title.textColor = .black
        title.backgroundColor = .systemGray3
        title.layer.borderWidth = 2
        title.layer.cornerRadius = 8
        title.layer.borderColor = UIColor.black.cgColor
        title.textAlignment = .left
        return title
    }()
    
    lazy var titleHeight: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = "Altura"
        title.font = UIFont(name: "Futura-Bold", size: 20)
        title.textColor = .black
        title.textAlignment = .left
        return title
    }()
    
    lazy var heightTextField: UITextField = {
        let title = UITextField(frame: .zero)
        title.keyboardType = .numberPad
        title.placeholder = "Digite sua Altura..."
        title.borderStyle = .roundedRect
        title.font = UIFont.systemFont(ofSize: 20)
        title.textColor = .black
        title.backgroundColor = .systemGray3
        title.layer.borderWidth = 2
        title.layer.cornerRadius = 8
        title.layer.borderColor = UIColor.black.cgColor
        title.textAlignment = .left
        return title
    }()
    
    lazy var textFieldContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 8
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextFieldView: ViewConfiguration {
    
    func buildViewHierarchy() {
        textFieldContainer.addArrangedSubview(titleWeight)
        textFieldContainer.addArrangedSubview(weightTextField)
        textFieldContainer.addArrangedSubview(titleHeight)
        textFieldContainer.addArrangedSubview(heightTextField)
        addSubview(textFieldContainer)
    }
    
    func setupConstraints() {
        textFieldContainer.snp.makeConstraints { make in
            make.left.right.equalTo(54).inset(20)
            make.top.equalTo(450)
            make.width.equalTo(100)
            make.height.equalTo(180)
            
        }
    }
    
    func setupConfiguration() {
        //
        
    }
}
