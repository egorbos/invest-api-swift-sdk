import Foundation

/// Облигация.
public protocol AssetBond {
    /// Текущий номинал.
    var currentNominal: Quotation { get }
    
    /// Наименование заемщика.
    var borrowName: String { get }
    
    /// Объем эмиссии облигации (стоимость).
    var issueSize: Quotation { get }
    
    /// Номинал облигации.
    var nominal: Quotation { get }
    
    /// Валюта номинала.
    var nominalCurrency: String { get }
    
    /// Форма выпуска облигации.
    var issueKind: String { get }
    
    /// Форма дохода облигации.
    var interestKind: String { get }
    
    /// Количество выплат в год.
    var couponQuantityPerYear: Int32 { get }
    
    /// Признак облигации с индексируемым номиналом.
    var indexedNominalFlag: Bool { get }
    
    /// Признак субординированной облигации.
    var subordinatedFlag: Bool { get }
    
    /// Признак обеспеченной облигации.
    var collateralFlag: Bool { get }
    
    /// Признак показывает, что купоны облигации не облагаются налогом (для mass market).
    var taxFreeFlag: Bool { get }
    
    /// Признак облигации с амортизацией долга.
    var amortizationFlag: Bool { get }
    
    /// Признак облигации с плавающим купоном.
    var floatingCouponFlag: Bool { get }
    
    /// Признак бессрочной облигации.
    var perpetualFlag: Bool { get }
    
    /// Дата погашения облигации.
    var maturityDate: Date { get }
    
    /// Описание и условия получения дополнительного дохода.
    var returnCondition: String { get }
    
    /// Дата выпуска облигации.
    var stateRegDate: Date { get }
    
    /// Дата размещения облигации.
    var placementDate: Date { get }
    
    /// Цена размещения облигации.
    var placementPrice: Quotation { get }
    
    /// Объявленное количество (штук).
    var issueSizePlan: Quotation { get }
}

internal struct AssetBondModel: AssetBond {
    let currentNominal: Quotation
    
    let borrowName: String
    
    let issueSize: Quotation
    
    let nominal: Quotation
    
    let nominalCurrency: String
    
    let issueKind: String
    
    let interestKind: String
    
    let couponQuantityPerYear: Int32
    
    let indexedNominalFlag: Bool
    
    let subordinatedFlag: Bool
    
    let collateralFlag: Bool
    
    let taxFreeFlag: Bool
    
    let amortizationFlag: Bool
    
    let floatingCouponFlag: Bool
    
    let perpetualFlag: Bool
    
    let maturityDate: Date
    
    let returnCondition: String
    
    let stateRegDate: Date
    
    let placementDate: Date
    
    let placementPrice: Quotation
    
    let issueSizePlan: Quotation
}

internal extension AssetBondModel {
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
    func toModel() -> AssetBondModel {
        AssetBondModel(grpcModel: self)
    }
}
