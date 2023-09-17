import Foundation

/// Облигация.
struct AssetBond: Codable {
    /// Текущий номинал.
    let currentNominal: Quotation
    
    /// Наименование заемщика.
    let borrowName: String
    
    /// Объем эмиссии облигации (стоимость).
    let issueSize: Quotation
    
    /// Номинал облигации.
    let nominal: Quotation
    
    /// Валюта номинала.
    let nominalCurrency: String
    
    /// Форма выпуска облигации.
    let issueKind: String
    
    /// Форма дохода облигации.
    let interestKind: String
    
    /// Количество выплат в год.
    let couponQuantityPerYear: Int32
    
    /// Признак облигации с индексируемым номиналом.
    let indexedNominalFlag: Bool
    
    /// Признак субординированной облигации.
    let subordinatedFlag: Bool
    
    /// Признак обеспеченной облигации.
    let collateralFlag: Bool
    
    /// Признак показывает, что купоны облигации не облагаются налогом (для mass market).
    let taxFreeFlag: Bool
    
    /// Признак облигации с амортизацией долга.
    let amortizationFlag: Bool
    
    /// Признак облигации с плавающим купоном.
    let floatingCouponFlag: Bool
    
    /// Признак бессрочной облигации.
    let perpetualFlag: Bool
    
    /// Дата погашения облигации.
    let maturityDate: Date
    
    /// Описание и условия получения дополнительного дохода.
    let returnCondition: String
    
    /// Дата выпуска облигации.
    let stateRegDate: Date
    
    /// Дата размещения облигации.
    let placementDate: Date
    
    /// Цена размещения облигации.
    let placementPrice: Quotation
    
    /// Объявленное количество (штук).
    let issueSizePlan: Quotation
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
