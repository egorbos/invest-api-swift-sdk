import Foundation

/// Структурная нота.
struct AssetStructuredProduct: Codable {
    /// Наименование заемщика.
    let borrowName: String
    
    /// Номинал.
    let nominal: Quotation
    
    /// Валюта номинала.
    let nominalCurrency: String
    
    /// Тип структурной ноты.
    let type: StructuredProductType
    
    /// Стратегия портфеля.
    let logicPortfolio: String
    
    /// Тип базового актива.
    let assetType: AssetType
    
    /// Вид базового актива в зависимости от типа базового актива.
    let basicAsset: String
    
    /// Барьер сохранности (в процентах).
    let safetyBarrier: Quotation
    
    /// Дата погашения.
    let maturityDate: Date
    
    /// Объявленное количество (штук).
    let issueSizePlan: Quotation
    
    /// Объем размещения.
    let issueSize: Quotation
    
    /// Дата размещения ноты.
    let placementDate: Date
    
    /// Форма выпуска.
    let issueKind: String
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
