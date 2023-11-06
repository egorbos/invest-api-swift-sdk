import Foundation

/// Акция.
public struct AssetShare: Codable {
    /// Тип акции.
    public let type: AssetShareType
    
    /// Объем выпуска (штук).
    public let issueSize: Quotation
    
    /// Номинал.
    public let nominal: Quotation
    
    /// Валюта номинала.
    public let nominalCurrency: String
    
    /// Индекс (Bloomberg).
    public let primaryIndex: String
    
    /// Ставка дивиденда (для привилегированных акций).
    public let dividendRate: Quotation
    
    /// Тип привилегированных акций.
    public let preferredShareType: String
    
    /// Дата IPO.
    public let ipoDate: Date
    
    /// Дата регистрации.
    public let registrationDate: Date
    
    /// Признак наличия дивидендной доходности.
    public let divYieldFlag: Bool
    
    /// Форма выпуска ФИ.
    public let issueKind: String
    
    /// Дата размещения акции.
    public let placementDate: Date
    
    /// ISIN базового актива.
    public let represIsin: String
    
    /// Объявленное количество (штук).
    public let issueSizePlan: Quotation
    
    /// Количество акций в свободном обращении (штук).
    public let totalFloat: Quotation
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
