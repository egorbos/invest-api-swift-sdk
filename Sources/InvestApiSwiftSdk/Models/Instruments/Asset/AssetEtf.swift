import Foundation

/// Фонд.
public protocol AssetEtf {
    /// Суммарные расходы фонда (в процентах).
    var totalExpense: Quotation { get }
    
    /// Барьерная ставка доходности после которой фонд имеет право на perfomance fee (в процентах).
    var hurdleRate: Quotation { get }
    
    /// Комиссия за успешные результаты фонда (в процентах).
    var performanceFee: Quotation { get }
    
    /// Фиксированная комиссия за управление (в процентах).
    var fixedCommission: Quotation { get }
    
    /// Тип распределения доходов от выплат по бумагам.
    var paymentType: String { get }
    
    /// Признак необходимости выхода фонда в плюс для получения комиссии.
    var watermarkFlag: Bool { get }
    
    /// Премия (надбавка к цене) при покупке доли в фонде (в процентах).
    var buyPremium: Quotation { get }
    
    /// Ставка дисконта (вычет из цены) при продаже доли в фонде (в процентах).
    var sellDiscount: Quotation { get }
    
    /// Признак ребалансируемости портфеля фонда.
    var rebalancingFlag: Bool { get }
    
    /// Периодичность ребалансировки.
    var rebalancingFrequency: String { get }
    
    /// Тип управления.
    var managementType: String { get }
    
    /// Индекс, который реплицирует (старается копировать) фонд.
    var primaryIndex: String { get }
    
    /// База ETF.
    var focusType: String { get }
    
    /// Признак использования заемных активов (плечо).
    var leveragedFlag: Bool { get }
    
    /// Количество акций в обращении.
    var numShare: Quotation { get }
    
    /// Признак обязательства по отчетности перед регулятором.
    var ucitsFlag: Bool { get }
    
    /// Дата выпуска.
    var releasedDate: Date { get }
    
    /// Описание фонда.
    var description: String { get }
    
    /// Описание индекса, за которым следует фонд.
    var primaryIndexDescription: String { get }
    
    /// Основные компании, в которые вкладывается фонд.
    var primaryIndexCompany: String { get }
    
    /// Срок восстановления индекса (после просадки).
    var indexRecoveryPeriod: Quotation { get }
    
    /// IVAV-код.
    var inavCode: String { get }
    
    /// Признак наличия дивидендной доходности.
    var divYieldFlag: Bool { get }
    
    /// Комиссия на покрытие расходов фонда (в процентах).
    var expenseCommission: Quotation { get }
    
    /// Ошибка следования за индексом (в процентах).
    var primaryIndexTrackingError: Quotation { get }
    
    /// Плановая ребалансировка портфеля.
    var rebalancingPlan: String { get }
    
    /// Ставки налогообложения дивидендов и купонов.
    var taxRate: String { get }
    
    /// Даты ребалансировок.
    var rebalancingDates: [Date] { get }
    
    /// Форма выпуска.
    var issueKind: String { get }
    
    /// Номинал.
    var nominal: Quotation { get }
    
    /// Валюта номинала.
    var nominalCurrency: String { get }
}

internal struct AssetEtfModel: AssetEtf {
    let totalExpense: Quotation
    
    let hurdleRate: Quotation
    
    let performanceFee: Quotation
    
    let fixedCommission: Quotation
    
    let paymentType: String
    
    let watermarkFlag: Bool
    
    let buyPremium: Quotation
    
    let sellDiscount: Quotation
    
    let rebalancingFlag: Bool
    
    let rebalancingFrequency: String
    
    let managementType: String
    
    let primaryIndex: String
    
    let focusType: String
    
    let leveragedFlag: Bool
    
    let numShare: Quotation
    
    let ucitsFlag: Bool
    
    let releasedDate: Date
    
    let description: String
    
    let primaryIndexDescription: String
    
    let primaryIndexCompany: String
    
    let indexRecoveryPeriod: Quotation
    
    let inavCode: String
    
    let divYieldFlag: Bool
    
    let expenseCommission: Quotation
    
    let primaryIndexTrackingError: Quotation
    
    let rebalancingPlan: String
    
    let taxRate: String
    
    let rebalancingDates: [Date]
    
    let issueKind: String
    
    let nominal: Quotation
    
    let nominalCurrency: String
}

internal extension AssetEtfModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AssetEtf) {
        self.totalExpense = grpcModel.totalExpense.toModel()
        self.hurdleRate = grpcModel.hurdleRate.toModel()
        self.performanceFee = grpcModel.performanceFee.toModel()
        self.fixedCommission = grpcModel.fixedCommission.toModel()
        self.paymentType = grpcModel.paymentType
        self.watermarkFlag = grpcModel.watermarkFlag
        self.buyPremium = grpcModel.buyPremium.toModel()
        self.sellDiscount = grpcModel.sellDiscount.toModel()
        self.rebalancingFlag = grpcModel.rebalancingFlag
        self.rebalancingFrequency = grpcModel.rebalancingFreq
        self.managementType = grpcModel.managementType
        self.primaryIndex = grpcModel.primaryIndex
        self.focusType = grpcModel.focusType
        self.leveragedFlag = grpcModel.leveragedFlag
        self.numShare = grpcModel.numShare.toModel()
        self.ucitsFlag = grpcModel.ucitsFlag
        self.releasedDate = grpcModel.releasedDate.date
        self.description = grpcModel.description_p
        self.primaryIndexDescription = grpcModel.primaryIndexDescription
        self.primaryIndexCompany = grpcModel.primaryIndexCompany
        self.indexRecoveryPeriod = grpcModel.indexRecoveryPeriod.toModel()
        self.inavCode = grpcModel.inavCode
        self.divYieldFlag = grpcModel.divYieldFlag
        self.expenseCommission = grpcModel.expenseCommission.toModel()
        self.primaryIndexTrackingError = grpcModel.primaryIndexTrackingError.toModel()
        self.rebalancingPlan = grpcModel.rebalancingPlan
        self.taxRate = grpcModel.taxRate
        self.rebalancingDates = grpcModel.rebalancingDates.map { $0.date }
        self.issueKind = grpcModel.issueKind
        self.nominal = grpcModel.nominal.toModel()
        self.nominalCurrency = grpcModel.nominalCurrency
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetEtf {
    func toModel() -> AssetEtfModel {
        AssetEtfModel(grpcModel: self)
    }
}
