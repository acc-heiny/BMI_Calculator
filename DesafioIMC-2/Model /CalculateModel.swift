struct CalculateResultModel {
    func calculateResultIMC(weight: Double, height: Double) -> Double {
        
        return weight / (height*height) * 10000
    }
}
