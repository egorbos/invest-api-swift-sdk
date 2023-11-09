import Foundation

/// Акция.
public protocol AssetShare {
    /// Тип акции.
    var type: AssetShareType { get }
    
    /// Объем выпуска (штук).
    var issueSize: Quotation { get }
    
    /// Номинал.
    var nominal: Quotation { get }
    
    /// Валюта номинала.
    var nominalCurrency: String { get }
    
    /// Индекс (Bloomberg).
    var primaryIndex: String { get }
    
    /// Ставка дивиденда (для привилегированных акций).
    var dividendRate: Quotation { get }
    
    /// Тип привилегированных акций.
    var preferredShareType: String { get }
    
    /// Дата IPO.
    var ipoDate: Date { get }
    
    /// Дата регистрации.
    var registrationDate: Date { get }
    
    /// Признак наличия дивидендной доходности.
    var divYieldFlag: Bool { get }
    
    /// Форма выпуска ФИ.
    var issueKind: String { get }
    
    /// Дата размещения акции.
    var placementDate: Date { get }
    
    /// ISIN базового актива.
    var represIsin: String { get }
    
    /// Объявленное количество (штук).
    var issueSizePlan: Quotation { get }
    
    /// Количество акций в свободном обращении (штук).
    var totalFloat: Quotation { get }
}

internal struct AssetShareModel: AssetShare {
    let type: AssetShareType
    
    let issueSize: Quotation
    
    let nominal: Quotation
    
    let nominalCurrency: String
    
    let primaryIndex: String
    
    let dividendRate: Quotation
    
    let preferredShareType: String
    
    let ipoDate: Date
    
    let registrationDate: Date
    
    let divYieldFlag: Bool
    
    let issueKind: String
    
    let placementDate: Date
    
    let represIsin: String
    
    let issueSizePlan: Quotation
    
    let totalFloat: Quotation
}

internal extension AssetShareModel {
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
    func toModel() throws -> AssetShareModel {
        try AssetShareModel(grpcModel: self)
    }
}
