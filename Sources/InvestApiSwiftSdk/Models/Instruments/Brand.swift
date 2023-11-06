/// Бренд.
public struct Brand: Codable {
    /// Uid идентификатор бренда.
    public let uid: String
    
    /// Наименование бренда.
    public let name: String
    
    /// Описание.
    public let description: String
    
    /// Информация о бренде.
    public let info: String
    
    /// Компания.
    public let company: String
    
    /// Сектор.
    public let sector: String
    
    /// Код страны риска.
    public let countryOfRisk: String
    
    /// Наименование страны риска.
    public let countryOfRiskName: String
}

internal extension Brand {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Brand) {
        self.uid = grpcModel.uid
        self.name = grpcModel.name
        self.description = grpcModel.description_p
        self.info = grpcModel.info
        self.company = grpcModel.company
        self.sector = grpcModel.sector
        self.countryOfRisk = grpcModel.countryOfRisk
        self.countryOfRiskName = grpcModel.countryOfRiskName
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Brand {
    func toModel() -> Brand {
        Brand(grpcModel: self)
    }
}
