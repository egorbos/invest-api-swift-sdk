import Foundation

/// Структурная нота.
public protocol AssetStructuredProduct {
    /// Наименование заемщика.
    var borrowName: String { get }
    
    /// Номинал.
    var nominal: Quotation { get }
    
    /// Валюта номинала.
    var nominalCurrency: String { get }
    
    /// Тип структурной ноты.
    var type: StructuredProductType { get }
    
    /// Стратегия портфеля.
    var logicPortfolio: String { get }
    
    /// Тип базового актива.
    var assetType: AssetType { get }
    
    /// Вид базового актива в зависимости от типа базового актива.
    var basicAsset: String { get }
    
    /// Барьер сохранности (в процентах).
    var safetyBarrier: Quotation { get }
    
    /// Дата погашения.
    var maturityDate: Date { get }
    
    /// Объявленное количество (штук).
    var issueSizePlan: Quotation { get }
    
    /// Объем размещения.
    var issueSize: Quotation { get }
    
    /// Дата размещения ноты.
    var placementDate: Date { get }
    
    /// Форма выпуска.
    var issueKind: String { get }
}

internal struct AssetStructuredProductModel: AssetStructuredProduct {
    let borrowName: String
    
    let nominal: Quotation
    
    let nominalCurrency: String
    
    let type: StructuredProductType
    
    let logicPortfolio: String
    
    let assetType: AssetType
    
    let basicAsset: String
    
    let safetyBarrier: Quotation
    
    let maturityDate: Date
    
    let issueSizePlan: Quotation
    
    let issueSize: Quotation
    
    let placementDate: Date
    
    let issueKind: String
}

internal extension AssetStructuredProductModel {
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
    func toModel() throws -> AssetStructuredProductModel {
        try AssetStructuredProductModel(grpcModel: self)
    }
}
