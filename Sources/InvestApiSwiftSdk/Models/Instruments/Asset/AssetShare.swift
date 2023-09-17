import Foundation

/// Акция.
struct AssetShare: Codable {
    /// Тип акции.
    let type: AssetShareType
    
    /// Объем выпуска (штук).
    let issueSize: Quotation
    
    /// Номинал.
    let nominal: Quotation
    
    /// Валюта номинала.
    let nominalCurrency: String
    
    /// Индекс (Bloomberg).
    let primaryIndex: String
    
    /// Ставка дивиденда (для привилегированных акций).
    let dividendRate: Quotation
    
    /// Тип привилегированных акций.
    let preferredShareType: String
    
    /// Дата IPO.
    let ipoDate: Date
    
    /// Дата регистрации.
    let registrationDate: Date
    
    /// Признак наличия дивидендной доходности.
    let divYieldFlag: Bool
    
    /// Форма выпуска ФИ.
    let issueKind: String
    
    /// Дата размещения акции.
    let placementDate: Date
    
    /// ISIN базового актива.
    let represIsin: String
    
    /// Объявленное количество (штук).
    let issueSizePlan: Quotation
    
    /// Количество акций в свободном обращении (штук).
    let totalFloat: Quotation
}

internal extension AssetShare {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetShare) throws {
        self.type = try .new(rawValue: grpcModel.type.rawValue)
        self.issueSize = grpcModel.issueSize.toModel()
        self.nominal = grpcModel.nominal.toModel()
        self.nominalCurrency = grpcModel.nominalCurrency
        self.primaryIndex = grpcModel.primaryIndex
        self.dividendRate = grpcModel.dividendRate.toModel()
        self.preferredShareType = grpcModel.preferredShareType
        self.ipoDate = grpcModel.ipoDate.date
        self.registrationDate = grpcModel.registryDate.date
        self.divYieldFlag = grpcModel.divYieldFlag
        self.issueKind = grpcModel.issueKind
        self.placementDate = grpcModel.placementDate.date
        self.represIsin = grpcModel.represIsin
        self.issueSizePlan = grpcModel.issueSizePlan.toModel()
        self.totalFloat = grpcModel.totalFloat.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetShare {
    func toModel() throws -> AssetShare {
        try AssetShare(grpcModel: self)
    }
}
