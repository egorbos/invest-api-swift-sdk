import Foundation

/// Фонд.
struct AssetEtf: Codable {
    /// Суммарные расходы фонда (в процентах).
    let totalExpense: Quotation
    
    /// Барьерная ставка доходности после которой фонд имеет право на perfomance fee (в процентах).
    let hurdleRate: Quotation
    
    /// Комиссия за успешные результаты фонда (в процентах).
    let performanceFee: Quotation
    
    /// Фиксированная комиссия за управление (в процентах).
    let fixedCommission: Quotation
    
    /// Тип распределения доходов от выплат по бумагам.
    let paymentType: String
    
    /// Признак необходимости выхода фонда в плюс для получения комиссии.
    let watermarkFlag: Bool
    
    /// Премия (надбавка к цене) при покупке доли в фонде (в процентах).
    let buyPremium: Quotation
    
    /// Ставка дисконта (вычет из цены) при продаже доли в фонде (в процентах).
    let sellDiscount: Quotation
    
    /// Признак ребалансируемости портфеля фонда.
    let rebalancingFlag: Bool
    
    /// Периодичность ребалансировки.
    let rebalancingFrequency: String
    
    /// Тип управления.
    let managementType: String
    
    /// Индекс, который реплицирует (старается копировать) фонд.
    let primaryIndex: String
    
    /// База ETF.
    let focusType: String
    
    /// Признак использования заемных активов (плечо).
    let leveragedFlag: Bool
    
    /// Количество акций в обращении.
    let numShare: Quotation
    
    /// Признак обязательства по отчетности перед регулятором.
    let ucitsFlag: Bool
    
    /// Дата выпуска.
    let releasedDate: Date
    
    /// Описание фонда.
    let description: String
    
    /// Описание индекса, за которым следует фонд.
    let primaryIndexDescription: String
    
    /// Основные компании, в которые вкладывается фонд.
    let primaryIndexCompany: String
    
    /// Срок восстановления индекса (после просадки).
    let indexRecoveryPeriod: Quotation
    
    /// IVAV-код.
    let inavCode: String
    
    /// Признак наличия дивидендной доходности.
    let divYieldFlag: Bool
    
    /// Комиссия на покрытие расходов фонда (в процентах).
    let expenseCommission: Quotation
    
    /// Ошибка следования за индексом (в процентах).
    let primaryIndexTrackingError: Quotation
    
    /// Плановая ребалансировка портфеля.
    let rebalancingPlan: String
    
    /// Ставки налогообложения дивидендов и купонов.
    let taxRate: String
    
    /// Даты ребалансировок.
    let rebalancingDates: [Date]
    
    /// Форма выпуска.
    let issueKind: String
    
    /// Номинал.
    let nominal: Quotation
    
    /// Валюта номинала.
    let nominalCurrency: String
}

internal extension AssetEtf {
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
    func toModel() -> AssetEtf {
        AssetEtf(grpcModel: self)
    }
}
