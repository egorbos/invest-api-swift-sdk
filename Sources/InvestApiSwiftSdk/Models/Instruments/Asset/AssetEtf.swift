import Foundation

/// Фонд.
public struct AssetEtf: Codable {
    /// Суммарные расходы фонда (в процентах).
    public let totalExpense: Quotation
    
    /// Барьерная ставка доходности после которой фонд имеет право на perfomance fee (в процентах).
    public let hurdleRate: Quotation
    
    /// Комиссия за успешные результаты фонда (в процентах).
    public let performanceFee: Quotation
    
    /// Фиксированная комиссия за управление (в процентах).
    public let fixedCommission: Quotation
    
    /// Тип распределения доходов от выплат по бумагам.
    public let paymentType: String
    
    /// Признак необходимости выхода фонда в плюс для получения комиссии.
    public let watermarkFlag: Bool
    
    /// Премия (надбавка к цене) при покупке доли в фонде (в процентах).
    public let buyPremium: Quotation
    
    /// Ставка дисконта (вычет из цены) при продаже доли в фонде (в процентах).
    public let sellDiscount: Quotation
    
    /// Признак ребалансируемости портфеля фонда.
    public let rebalancingFlag: Bool
    
    /// Периодичность ребалансировки.
    public let rebalancingFrequency: String
    
    /// Тип управления.
    public let managementType: String
    
    /// Индекс, который реплицирует (старается копировать) фонд.
    public let primaryIndex: String
    
    /// База ETF.
    public let focusType: String
    
    /// Признак использования заемных активов (плечо).
    public let leveragedFlag: Bool
    
    /// Количество акций в обращении.
    public let numShare: Quotation
    
    /// Признак обязательства по отчетности перед регулятором.
    public let ucitsFlag: Bool
    
    /// Дата выпуска.
    public let releasedDate: Date
    
    /// Описание фонда.
    public let description: String
    
    /// Описание индекса, за которым следует фонд.
    public let primaryIndexDescription: String
    
    /// Основные компании, в которые вкладывается фонд.
    public let primaryIndexCompany: String
    
    /// Срок восстановления индекса (после просадки).
    public let indexRecoveryPeriod: Quotation
    
    /// IVAV-код.
    public let inavCode: String
    
    /// Признак наличия дивидендной доходности.
    public let divYieldFlag: Bool
    
    /// Комиссия на покрытие расходов фонда (в процентах).
    public let expenseCommission: Quotation
    
    /// Ошибка следования за индексом (в процентах).
    public let primaryIndexTrackingError: Quotation
    
    /// Плановая ребалансировка портфеля.
    public let rebalancingPlan: String
    
    /// Ставки налогообложения дивидендов и купонов.
    public let taxRate: String
    
    /// Даты ребалансировок.
    public let rebalancingDates: [Date]
    
    /// Форма выпуска.
    public let issueKind: String
    
    /// Номинал.
    public let nominal: Quotation
    
    /// Валюта номинала.
    public let nominalCurrency: String
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
