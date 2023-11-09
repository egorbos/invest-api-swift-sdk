/// Бренд.
public protocol Brand {
    /// Uid идентификатор бренда.
    var uid: String { get }
    
    /// Наименование бренда.
    var name: String { get }
    
    /// Описание.
    var description: String { get }
    
    /// Информация о бренде.
    var info: String { get }
    
    /// Компания.
    var company: String { get }
    
    /// Сектор.
    var sector: String { get }
    
    /// Код страны риска.
    var countryOfRisk: String { get }
    
    /// Наименование страны риска.
    var countryOfRiskName: String { get }
}

internal struct BrandModel: Brand {
    let uid: String
    
    let name: String
    
    let description: String
    
    let info: String
    
    let company: String
    
    let sector: String
    
    let countryOfRisk: String
    
    let countryOfRiskName: String
}

internal extension BrandModel {
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
    func toModel() -> BrandModel {
        BrandModel(grpcModel: self)
    }
}
