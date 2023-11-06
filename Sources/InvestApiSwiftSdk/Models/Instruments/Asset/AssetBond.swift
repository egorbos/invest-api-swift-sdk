import Foundation

/// Облигация.
public struct AssetBond: Codable {
    /// Текущий номинал.
    public let currentNominal: Quotation
    
    /// Наименование заемщика.
    public let borrowName: String
    
    /// Объем эмиссии облигации (стоимость).
    public let issueSize: Quotation
    
    /// Номинал облигации.
    public let nominal: Quotation
    
    /// Валюта номинала.
    public let nominalCurrency: String
    
    /// Форма выпуска облигации.
    public let issueKind: String
    
    /// Форма дохода облигации.
    public let interestKind: String
    
    /// Количество выплат в год.
    public let couponQuantityPerYear: Int32
    
    /// Признак облигации с индексируемым номиналом.
    public let indexedNominalFlag: Bool
    
    /// Признак субординированной облигации.
    public let subordinatedFlag: Bool
    
    /// Признак обеспеченной облигации.
    public let collateralFlag: Bool
    
    /// Признак показывает, что купоны облигации не облагаются налогом (для mass market).
    public let taxFreeFlag: Bool
    
    /// Признак облигации с амортизацией долга.
    public let amortizationFlag: Bool
    
    /// Признак облигации с плавающим купоном.
    public let floatingCouponFlag: Bool
    
    /// Признак бессрочной облигации.
    public let perpetualFlag: Bool
    
    /// Дата погашения облигации.
    public let maturityDate: Date
    
    /// Описание и условия получения дополнительного дохода.
    public let returnCondition: String
    
    /// Дата выпуска облигации.
    public let stateRegDate: Date
    
    /// Дата размещения облигации.
    public let placementDate: Date
    
    /// Цена размещения облигации.
    public let placementPrice: Quotation
    
    /// Объявленное количество (штук).
    public let issueSizePlan: Quotation
}

internal extension AssetBond {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetBond) {
        self.currentNominal = grpcModel.currentNominal.toModel()
        self.borrowName = grpcModel.borrowName
        self.issueSize = grpcModel.issueSize.toModel()
        self.nominal = grpcModel.nominal.toModel()
        self.nominalCurrency = grpcModel.nominalCurrency
        self.issueKind = grpcModel.issueKind
        self.interestKind = grpcModel.interestKind
        self.couponQuantityPerYear = grpcModel.couponQuantityPerYear
        self.indexedNominalFlag = grpcModel.indexedNominalFlag
        self.subordinatedFlag = grpcModel.subordinatedFlag
        self.collateralFlag = grpcModel.collateralFlag
        self.taxFreeFlag = grpcModel.taxFreeFlag
        self.amortizationFlag = grpcModel.amortizationFlag
        self.floatingCouponFlag = grpcModel.floatingCouponFlag
        self.perpetualFlag = grpcModel.perpetualFlag
        self.maturityDate = grpcModel.maturityDate.date
        self.returnCondition = grpcModel.returnCondition
        self.stateRegDate = grpcModel.stateRegDate.date
        self.placementDate = grpcModel.placementDate.date
        self.placementPrice = grpcModel.placementPrice.toModel()
        self.issueSizePlan = grpcModel.issueSizePlan.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetBond {
    func toModel() -> AssetBond {
        AssetBond(grpcModel: self)
    }
}
