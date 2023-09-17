/// Бренд.
public struct Brand: Codable {
    /// Uid идентификатор бренда.
    let uid: String
    
    /// Наименование бренда.
    let name: String
    
    /// Описание.
    let description: String
    
    /// Информация о бренде.
    let info: String
    
    /// Компания.
    let company: String
    
    /// Сектор.
    let sector: String
    
    /// Код страны риска.
    let countryOfRisk: String
    
    /// Наименование страны риска.
    let countryOfRiskName: String
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