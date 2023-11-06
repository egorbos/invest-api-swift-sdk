import Foundation

/// Структурная нота.
public struct AssetStructuredProduct: Codable {
    /// Наименование заемщика.
    public let borrowName: String
    
    /// Номинал.
    public let nominal: Quotation
    
    /// Валюта номинала.
    public let nominalCurrency: String
    
    /// Тип структурной ноты.
    public let type: StructuredProductType
    
    /// Стратегия портфеля.
    public let logicPortfolio: String
    
    /// Тип базового актива.
    public let assetType: AssetType
    
    /// Вид базового актива в зависимости от типа базового актива.
    public let basicAsset: String
    
    /// Барьер сохранности (в процентах).
    public let safetyBarrier: Quotation
    
    /// Дата погашения.
    public let maturityDate: Date
    
    /// Объявленное количество (штук).
    public let issueSizePlan: Quotation
    
    /// Объем размещения.
    public let issueSize: Quotation
    
    /// Дата размещения ноты.
    public let placementDate: Date
    
    /// Форма выпуска.
    public let issueKind: String
}

internal extension AssetStructuredProduct {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetStructuredProduct) throws {
        self.borrowName = grpcModel.borrowName
        self.nominal = grpcModel.nominal.toModel()
        self.nominalCurrency = grpcModel.nominalCurrency
        self.type = try .new(rawValue: grpcModel.type.rawValue)
        self.logicPortfolio = grpcModel.logicPortfolio
        self.assetType = try .new(rawValue: grpcModel.assetType.rawValue)
        self.basicAsset = grpcModel.basicAsset
        self.safetyBarrier = grpcModel.safetyBarrier.toModel()
        self.maturityDate = grpcModel.maturityDate.date
        self.issueSizePlan = grpcModel.issueSizePlan.toModel()
        self.issueSize = grpcModel.issueSize.toModel()
        self.placementDate = grpcModel.placementDate.date
        self.issueKind = grpcModel.issueKind
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetStructuredProduct {
    func toModel() throws -> AssetStructuredProduct {
        try AssetStructuredProduct(grpcModel: self)
    }
}
