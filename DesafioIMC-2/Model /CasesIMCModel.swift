protocol Layoutable {
    var title: String { get }
    var imageName: String { get }
}

enum BMIResultSetup: Layoutable {
    
    case lowWeight
    case normalWeight
    case obesity
    case obesityGradeI
    case obesityGradeII
    case obesityGradeIII
    
    var title: String {
        switch self {
        case .lowWeight:
            return "Baixo Peso"
        case .normalWeight:
            return "Peso Normal"
        case .obesity:
            return "Obesidade"
        case .obesityGradeI:
            return "Obesidade grau I"
        case .obesityGradeII:
            return "Obesidade grau II"
        case .obesityGradeIII:
            return "Obesidade grau III"
        }
    }
    
    var imageName: String {
        switch self {
        case .lowWeight:
            return "Madruga"
        case .normalWeight:
            return "Pops"
        case .obesity, .obesityGradeI, .obesityGradeII, .obesityGradeIII:
            return "Barriga"
        }
    }
}

struct ShowResultModel {
    
    var setup: BMIResultSetup
    
    init (bmiResult: Double) {
        
        if bmiResult < 18.5 {
            setup = .lowWeight
        } else if bmiResult > 18.5 && bmiResult < 25 {
            setup = .normalWeight
        } else if bmiResult > 25 && bmiResult < 30 {
            setup = .obesity
        } else if bmiResult > 30 && bmiResult < 35 {
            setup = .obesityGradeI
        } else if bmiResult > 35 && bmiResult < 40 {
            setup = .obesityGradeII
        } else {
            setup = .obesityGradeIII
        }
    }
}
