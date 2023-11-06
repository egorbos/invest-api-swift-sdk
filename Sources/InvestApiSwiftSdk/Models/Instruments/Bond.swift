import Foundation

/// Информация об облигации.
public struct Bond: Codable {
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Уникальный идентификатор инструмента.
    public let uid: String
    
    /// Тикер инструмента.
    public let ticker: String
    
    /// Класс-код (секция торгов).
    public let classCode: String
    
    /// Isin-идентификатор инструмента.
    public let isin: String
    
    /// Лотность инструмента (возможно совершение операций только на количества ценной бумаги, кратные параметру lot).
    public let lot: Int32
    
    /// Название инструмента.
    public let name: String
    
    /// Валюта расчётов.
    public let currency: CurrencyType
    
    /// Коэффициент ставки риска длинной позиции по клиенту: 1 – клиент с повышенным уровнем риска (КПУР), 2 – клиент со стандартным уровнем риска (КСУР).
    public let klong: Quotation
    
    /// Коэффициент ставки риска короткой позиции по клиенту: 1 – клиент с повышенным уровнем риска (КПУР), 2 – клиент со стандартным уровнем риска (КСУР).
    public let kshort: Quotation
    
    /// Ставка риска начальной маржи для КСУР лонг.
    public let dlong: Quotation
    
    /// Ставка риска начальной маржи для КСУР шорт.
    public let dshort: Quotation
    
    /// Ставка риска начальной маржи для КПУР лонг.
    public let dlongMin: Quotation
    
    /// Ставка риска начальной маржи для КПУР шорт.
    public let dshortMin: Quotation
    
    /// Признак доступности для операций в шорт.
    public let shortEnabledFlag: Bool
    
    /// Tорговая площадка (секция биржи).
    public let exchange: String
    
    /// Количество выплат по купонам в год.
    public let couponQuantityPerYear: Int32
    
    /// Дата погашения облигации в часовом поясе UTC.
    public let maturityDate: Date
    
    /// Номинал.
    public let nominal: MoneyValue
    
    /// Первоначальный номинал облигации.
    public let initialNominal: MoneyValue
    
    /// Дата выпуска облигации в часовом поясе UTC.
    public let stateRegDate: Date
    
    /// Дата размещения в часовом поясе UTC.
    public let placementDate: Date
    
    /// Цена размещения.
    public let placementPrice: MoneyValue
    
    /// Значение НКД (накопленного купонного дохода) на дату.
    public let accumCouponValue: MoneyValue
    
    /// Код страны риска (в которой компания ведёт основной бизнес).
    public let countryOfRisk: String
    
    /// Наименование страны риска (в которой компания ведёт основной бизнес).
    public let countryOfRiskName: String
    
    /// Сектор экономики.
    public let sector: String
    
    /// Форма выпуска.
    public let issueKind: IssueKindType
    
    /// Размер выпуска.
    public let issueSize: Int64
    
    /// Плановый размер выпуска.
    public let issueSizePlan: Int64
    
    /// Текущий режим торгов инструмента.
    public let tradingStatus: SecurityTradingStatus
    
    /// Признак внебиржевой ценной бумаги.
    public let otcFlag: Bool
    
    /// Признак доступности для покупки.
    public let buyAvailableFlag: Bool
    
    /// Признак доступности для продажи.
    public let sellAvailableFlag: Bool
    
    /// Признак облигации с плавающим купоном.
    public let floatingCouponFlag: Bool
    
    /// Признак бессрочной облигации.
    public let perpetualFlag: Bool
    
    /// Признак облигации с амортизацией долга.
    public let amortizationFlag: Bool
    
    /// Шаг цены.
    public let minPriceIncrement: Quotation
    
    /// Параметр указывает на возможность торговать инструментом через API.
    public let apiTradeAvailableFlag: Bool
    
    /// Реальная площадка исполнения расчётов (биржа).
    public let realExchange: RealExchange
    
    /// Уникальный идентификатор позиции инструмента.
    public let positionUid: String
    
    /// Признак доступности для ИИС.
    public let forIisFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    public let forQualInvestorFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом по выходным.
    public let weekendFlag: Bool
    
    /// Флаг заблокированного ТКС.
    public let blockedTcaFlag: Bool
    
    /// Признак субординированной облигации.
    public let subordinatedFlag: Bool
    
    /// Флаг достаточной ликвидности.
    public let liquidityFlag: Bool
    
    /// Дата первой минутной свечи.
    public let firstOneMinCandleDate: Date
    
    /// Дата первой дневной свечи.
    public let firstOneDayCandleDate: Date
    
    /// Уровень риска.
    public let riskLevel: RiskLevel
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
        self.currency = try .new(rawValue: grpcModel.currency)
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
