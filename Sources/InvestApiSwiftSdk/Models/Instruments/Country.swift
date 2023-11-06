/// Данные о стране.
public struct Country: Codable {
    /// Двухбуквенный код страны.
    public let alfaTwo: String
    
    /// Трёхбуквенный код страны.
    public let alfaThree: String
    
    /// Наименование страны.
    public let name: String
    
    /// Краткое наименование страны.
    public let nameBrief: String
}

internal extension Country {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_CountryResponse) {
        self.alfaTwo = grpcModel.alfaTwo
        self.alfaThree = grpcModel.alfaThree
        self.name = grpcModel.name
        self.nameBrief = grpcModel.nameBrief
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CountryResponse {
    func toModel() -> Country {
        Country(grpcModel: self)
    }
}
