import Foundation

/// Информация об инвестиционном фонде.
public struct Etf: Codable {
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
    
    /// Размер фиксированной комиссии фонда.
    public let fixedCommission: Quotation
    
    /// Направление инвистирования фонда.
    public let focusType: EtfFocusType
    
    /// Дата выпуска в часовом поясе UTC.
    public let releasedDate: Date
    
    /// Количество акций фонда в обращении.
    public let numShares: Quotation
    
    /// Код страны риска (в которой компания ведёт основной бизнес).
    public let countryOfRisk: String
    
    /// Наименование страны риска (в которой компания ведёт основной бизнес).
    public let countryOfRiskName: String
    
    /// Сектор экономики.
    public let sector: String
    
    /// Частота ребалансировки.
    public let rebalancingFrequency: String
    
    /// Текущий режим торгов инструмента.
    public let tradingStatus: SecurityTradingStatus
    
    /// Признак внебиржевой ценной бумаги.
    public let otcFlag: Bool
    
    /// Признак доступности для покупки.
    public let buyAvailableFlag: Bool
    
    /// Признак доступности для продажи.
    public let sellAvailableFlag: Bool
    
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
    
    /// Флаг достаточной ликвидности.
    public let liquidityFlag: Bool
    
    /// Дата первой минутной свечи.
    public let firstOneMinCandleDate: Date
    
    /// Дата первой дневной свечи.
    public let firstOneDayCandleDate: Date
}

internal extension Etf {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Etf) throws {
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
        self.fixedCommission = grpcModel.fixedCommission.toModel()
        self.focusType = try .new(rawValue: grpcModel.focusType)
        self.releasedDate = grpcModel.releasedDate.date
        self.numShares = grpcModel.numShares.toModel()
        self.countryOfRisk = grpcModel.countryOfRisk
        self.countryOfRiskName = grpcModel.countryOfRiskName
        self.sector = grpcModel.sector
        self.rebalancingFrequency = grpcModel.rebalancingFreq
        self.tradingStatus = try .new(rawValue: grpcModel.tradingStatus.rawValue)
        self.otcFlag = grpcModel.otcFlag
        self.buyAvailableFlag = grpcModel.buyAvailableFlag
        self.sellAvailableFlag = grpcModel.sellAvailableFlag
        self.minPriceIncrement = grpcModel.minPriceIncrement.toModel()
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
        self.realExchange = try .new(rawValue: grpcModel.realExchange.rawValue)
        self.positionUid = grpcModel.positionUid
        self.forIisFlag = grpcModel.forIisFlag
        self.forQualInvestorFlag = grpcModel.forQualInvestorFlag
        self.weekendFlag = grpcModel.weekendFlag
        self.blockedTcaFlag = grpcModel.blockedTcaFlag
        self.liquidityFlag = grpcModel.liquidityFlag
        self.firstOneMinCandleDate = grpcModel.first1MinCandleDate.date
        self.firstOneDayCandleDate = grpcModel.first1DayCandleDate.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Etf {
    func toModel() throws -> Etf {
        try Etf(grpcModel: self)
    }
}
