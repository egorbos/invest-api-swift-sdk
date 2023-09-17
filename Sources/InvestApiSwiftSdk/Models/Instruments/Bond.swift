import Foundation

/// Информация об облигации.
public struct Bond: Codable {
    /// Figi-идентификатор инструмента.
    let figi: String
    
    /// Уникальный идентификатор инструмента.
    let uid: String
    
    /// Тикер инструмента.
    let ticker: String
    
    /// Класс-код (секция торгов).
    let classCode: String
    
    /// Isin-идентификатор инструмента.
    let isin: String
    
    /// Лотность инструмента (возможно совершение операций только на количества ценной бумаги, кратные параметру lot).
    let lot: Int32
    
    /// Название инструмента.
    let name: String
    
    /// Валюта расчётов.
    let currency: String // MARK: Возможно изменить на CurrencyType?
    
    /// Коэффициент ставки риска длинной позиции по клиенту: 1 – клиент с повышенным уровнем риска (КПУР), 2 – клиент со стандартным уровнем риска (КСУР).
    let klong: Quotation
    
    /// Коэффициент ставки риска короткой позиции по клиенту: 1 – клиент с повышенным уровнем риска (КПУР), 2 – клиент со стандартным уровнем риска (КСУР).
    let kshort: Quotation
    
    /// Ставка риска начальной маржи для КСУР лонг.
    let dlong: Quotation
    
    /// Ставка риска начальной маржи для КСУР шорт.
    let dshort: Quotation
    
    /// Ставка риска начальной маржи для КПУР лонг.
    let dlongMin: Quotation
    
    /// Ставка риска начальной маржи для КПУР шорт.
    let dshortMin: Quotation
    
    /// Признак доступности для операций в шорт.
    let shortEnabledFlag: Bool
    
    /// Tорговая площадка (секция биржи).
    let exchange: String
    
    /// Количество выплат по купонам в год.
    let couponQuantityPerYear: Int32
    
    /// Дата погашения облигации в часовом поясе UTC.
    let maturityDate: Date
    
    /// Номинал.
    let nominal: MoneyValue
    
    /// Первоначальный номинал облигации.
    let initialNominal: MoneyValue
    
    /// Дата выпуска облигации в часовом поясе UTC.
    let stateRegDate: Date
    
    /// Дата размещения в часовом поясе UTC.
    let placementDate: Date
    
    /// Цена размещения.
    let placementPrice: MoneyValue
    
    /// Значение НКД (накопленного купонного дохода) на дату.
    let accumCouponValue: MoneyValue
    
    /// Код страны риска (в которой компания ведёт основной бизнес).
    let countryOfRisk: String
    
    /// Наименование страны риска (в которой компания ведёт основной бизнес).
    let countryOfRiskName: String
    
    /// Сектор экономики.
    let sector: String
    
    /// Форма выпуска.
    let issueKind: IssueKindType
    
    /// Размер выпуска.
    let issueSize: Int64
    
    /// Плановый размер выпуска.
    let issueSizePlan: Int64
    
    /// Текущий режим торгов инструмента.
    let tradingStatus: SecurityTradingStatus
    
    /// Признак внебиржевой ценной бумаги.
    let otcFlag: Bool
    
    /// Признак доступности для покупки.
    let buyAvailableFlag: Bool
    
    /// Признак доступности для продажи.
    let sellAvailableFlag: Bool
    
    /// Признак облигации с плавающим купоном.
    let floatingCouponFlag: Bool
    
    /// Признак бессрочной облигации.
    let perpetualFlag: Bool
    
    /// Признак облигации с амортизацией долга.
    let amortizationFlag: Bool
    
    /// Шаг цены.
    let minPriceIncrement: Quotation
    
    /// Параметр указывает на возможность торговать инструментом через API.
    let apiTradeAvailableFlag: Bool
    
    /// Реальная площадка исполнения расчётов (биржа).
    let realExchange: RealExchange
    
    /// Уникальный идентификатор позиции инструмента.
    let positionUid: String
    
    /// Признак доступности для ИИС.
    let forIisFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    let forQualInvestorFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом по выходным.
    let weekendFlag: Bool
    
    /// Флаг заблокированного ТКС.
    let blockedTcaFlag: Bool
    
    /// Признак субординированной облигации.
    let subordinatedFlag: Bool
    
    /// Флаг достаточной ликвидности.
    let liquidityFlag: Bool
    
    /// Дата первой минутной свечи.
    let firstOneMinCandleDate: Date
    
    /// Дата первой дневной свечи.
    let firstOneDayCandleDate: Date
    
    /// Уровень риска.
    let riskLevel: RiskLevel
}

internal extension Bond {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Bond) throws {
        self.figi = grpcModel.figi
        self.uid = grpcModel.uid
        self.ticker = grpcModel.ticker
        self.classCode = grpcModel.classCode
        self.isin = grpcModel.isin
        self.lot = grpcModel.lot
        self.name = grpcModel.name
        self.currency = grpcModel.currency
        self.klong = grpcModel.klong.toModel()
        self.kshort = grpcModel.kshort.toModel()
        self.dlong = grpcModel.dlong.toModel()
        self.dshort = grpcModel.dshort.toModel()
        self.dlongMin = grpcModel.dlongMin.toModel()
        self.dshortMin = grpcModel.dshortMin.toModel()
        self.shortEnabledFlag = grpcModel.shortEnabledFlag
        self.exchange = grpcModel.exchange
        self.couponQuantityPerYear = grpcModel.couponQuantityPerYear
        self.maturityDate = grpcModel.maturityDate.date
        self.nominal = grpcModel.nominal.toModel()
        self.initialNominal = grpcModel.initialNominal.toModel()
        self.stateRegDate = grpcModel.stateRegDate.date
        self.placementDate = grpcModel.placementDate.date
        self.placementPrice = grpcModel.placementPrice.toModel()
        self.accumCouponValue = grpcModel.aciValue.toModel()
        self.countryOfRisk = grpcModel.countryOfRisk
        self.countryOfRiskName = grpcModel.countryOfRiskName
        self.sector = grpcModel.sector
        self.issueKind = try .new(rawValue: grpcModel.issueKind)
        self.issueSize = grpcModel.issueSize
        self.issueSizePlan = grpcModel.issueSizePlan
        self.tradingStatus = try .new(rawValue: grpcModel.tradingStatus.rawValue)
        self.otcFlag = grpcModel.otcFlag
        self.buyAvailableFlag = grpcModel.buyAvailableFlag
        self.sellAvailableFlag = grpcModel.sellAvailableFlag
        self.floatingCouponFlag = grpcModel.floatingCouponFlag
        self.perpetualFlag = grpcModel.perpetualFlag
        self.amortizationFlag = grpcModel.amortizationFlag
        self.minPriceIncrement = grpcModel.minPriceIncrement.toModel()
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
        self.realExchange = try .new(rawValue: grpcModel.realExchange.rawValue)
        self.positionUid = grpcModel.positionUid
        self.forIisFlag = grpcModel.forIisFlag
        self.forQualInvestorFlag = grpcModel.forQualInvestorFlag
        self.weekendFlag = grpcModel.weekendFlag
        self.blockedTcaFlag = grpcModel.blockedTcaFlag
        self.subordinatedFlag = grpcModel.subordinatedFlag
        self.liquidityFlag = grpcModel.liquidityFlag
        self.firstOneMinCandleDate = grpcModel.first1MinCandleDate.date
        self.firstOneDayCandleDate = grpcModel.first1DayCandleDate.date
        self.riskLevel = try .new(rawValue: grpcModel.riskLevel.rawValue)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Bond {
    func toModel() throws -> Bond {
        try Bond(grpcModel: self)
    }
}
