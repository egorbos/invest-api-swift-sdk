/// Данные о стране.
public protocol Country {
    /// Двухбуквенный код страны.
    var alfaTwo: String { get }
    
    /// Трёхбуквенный код страны.
    var alfaThree: String { get }
    
    /// Наименование страны.
    var name: String { get }
    
    /// Краткое наименование страны.
    var nameBrief: String { get }
}

internal struct CountryModel: Country {
    let alfaTwo: String
    
    let alfaThree: String
    
    let name: String
    
    let nameBrief: String
}

internal extension CountryModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_CountryResponse) {
        self.alfaTwo = grpcModel.alfaTwo
        self.alfaThree = grpcModel.alfaThree
        self.name = grpcModel.name
        self.nameBrief = grpcModel.nameBrief
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CountryResponse {
    func toModel() -> CountryModel {
        CountryModel(grpcModel: self)
    }
}
