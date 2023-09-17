import Foundation

/// Информация о валюте.
public struct Currency: Codable {
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
    
    /// Номинал.
    let nominal: MoneyValue
    
    /// Код страны риска (в которой компания ведёт основной бизнес).
    let countryOfRisk: String
    
    /// Наименование страны риска (в которой компания ведёт основной бизнес).
    let countryOfRiskName: String
    
    /// Текущий режим торгов инструмента.
    let tradingStatus: SecurityTradingStatus
    
    /// Признак внебиржевой ценной бумаги.
    let otcFlag: Bool
    
    /// Признак доступности для покупки.
    let buyAvailableFlag: Bool
    
    /// Признак доступности для продажи.
    let sellAvailableFlag: Bool
    
    /// Строковый ISO-код валюты.
    let isoCurrencyName: String
    
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
    
    /// Дата первой минутной свечи.
    let firstOneMinCandleDate: Date
    
    /// Дата первой дневной свечи.
    let firstOneDayCandleDate: Date
}

internal extension Currency {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Currency) throws {
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
        self.nominal = grpcModel.nominal.toModel()
        self.countryOfRisk = grpcModel.countryOfRisk
        self.countryOfRiskName = grpcModel.countryOfRiskName
        self.tradingStatus = try .new(rawValue: grpcModel.tradingStatus.rawValue)
        self.otcFlag = grpcModel.otcFlag
        self.buyAvailableFlag = grpcModel.buyAvailableFlag
        self.sellAvailableFlag = grpcModel.sellAvailableFlag
        self.isoCurrencyName = grpcModel.isoCurrencyName
        self.minPriceIncrement = grpcModel.minPriceIncrement.toModel()
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
        self.realExchange = try .new(rawValue: grpcModel.realExchange.rawValue)
        self.positionUid = grpcModel.positionUid
        self.forIisFlag = grpcModel.forIisFlag
        self.forQualInvestorFlag = grpcModel.forQualInvestorFlag
        self.weekendFlag = grpcModel.weekendFlag
        self.blockedTcaFlag = grpcModel.blockedTcaFlag
        self.firstOneMinCandleDate = grpcModel.first1MinCandleDate.date
        self.firstOneDayCandleDate = grpcModel.first1DayCandleDate.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Currency {
    func toModel() throws -> Currency {
        try Currency(grpcModel: self)
    }
}
