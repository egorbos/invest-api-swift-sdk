import Foundation

/// Информация о валюте.
public protocol Currency {
    /// Figi-идентификатор инструмента.
    var figi: String { get }
    
    /// Уникальный идентификатор инструмента.
    var uid: String { get }
    
    /// Тикер инструмента.
    var ticker: String { get }
    
    /// Класс-код (секция торгов).
    var classCode: String { get }
    
    /// Isin-идентификатор инструмента.
    var isin: String { get }
    
    /// Лотность инструмента (возможно совершение операций только на количества ценной бумаги, кратные параметру lot).
    var lot: Int32 { get }
    
    /// Название инструмента.
    var name: String { get }
    
    /// Валюта расчётов.
    var currency: CurrencyType { get }
    
    /// Коэффициент ставки риска длинной позиции по клиенту: 1 – клиент с повышенным уровнем риска (КПУР), 2 – клиент со стандартным уровнем риска (КСУР).
    var klong: Quotation { get }
    
    /// Коэффициент ставки риска короткой позиции по клиенту: 1 – клиент с повышенным уровнем риска (КПУР), 2 – клиент со стандартным уровнем риска (КСУР).
    var kshort: Quotation { get }
    
    /// Ставка риска начальной маржи для КСУР лонг.
    var dlong: Quotation { get }
    
    /// Ставка риска начальной маржи для КСУР шорт.
    var dshort: Quotation { get }
    
    /// Ставка риска начальной маржи для КПУР лонг.
    var dlongMin: Quotation { get }
    
    /// Ставка риска начальной маржи для КПУР шорт.
    var dshortMin: Quotation { get }
    
    /// Признак доступности для операций в шорт.
    var shortEnabledFlag: Bool { get }
    
    /// Tорговая площадка (секция биржи).
    var exchange: String { get }
    
    /// Номинал.
    var nominal: MoneyValue { get }
    
    /// Код страны риска (в которой компания ведёт основной бизнес).
    var countryOfRisk: String { get }
    
    /// Наименование страны риска (в которой компания ведёт основной бизнес).
    var countryOfRiskName: String { get }
    
    /// Текущий режим торгов инструмента.
    var tradingStatus: SecurityTradingStatus { get }
    
    /// Признак внебиржевой ценной бумаги.
    var otcFlag: Bool { get }
    
    /// Признак доступности для покупки.
    var buyAvailableFlag: Bool { get }
    
    /// Признак доступности для продажи.
    var sellAvailableFlag: Bool { get }
    
    /// Строковый ISO-код валюты.
    var isoCurrencyName: String { get }
    
    /// Шаг цены.
    var minPriceIncrement: Quotation { get }
    
    /// Параметр указывает на возможность торговать инструментом через API.
    var apiTradeAvailableFlag: Bool { get }
    
    /// Реальная площадка исполнения расчётов (биржа).
    var realExchange: RealExchange { get }
    
    /// Уникальный идентификатор позиции инструмента.
    var positionUid: String { get }
    
    /// Признак доступности для ИИС.
    var forIisFlag: Bool { get }
    
    /// Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    var forQualInvestorFlag: Bool { get }
    
    /// Флаг отображающий доступность торговли инструментом по выходным.
    var weekendFlag: Bool { get }
    
    /// Флаг заблокированного ТКС.
    var blockedTcaFlag: Bool { get }
    
    /// Дата первой минутной свечи.
    var firstOneMinCandleDate: Date { get }
    
    /// Дата первой дневной свечи.
    var firstOneDayCandleDate: Date { get }
}

internal struct CurrencyModel: Currency {
    let figi: String
    
    let uid: String
    
    let ticker: String
    
    let classCode: String
    
    let isin: String
    
    let lot: Int32
    
    let name: String
    
    let currency: CurrencyType
    
    let klong: Quotation
    
    let kshort: Quotation
    
    let dlong: Quotation
    
    let dshort: Quotation
    
    let dlongMin: Quotation
    
    let dshortMin: Quotation
    
    let shortEnabledFlag: Bool
    
    let exchange: String
    
    let nominal: MoneyValue
    
    let countryOfRisk: String
    
    let countryOfRiskName: String
    
    let tradingStatus: SecurityTradingStatus
    
    let otcFlag: Bool
    
    let buyAvailableFlag: Bool
    
    let sellAvailableFlag: Bool
    
    let isoCurrencyName: String
    
    let minPriceIncrement: Quotation
    
    let apiTradeAvailableFlag: Bool
    
    let realExchange: RealExchange
    
    let positionUid: String
    
    let forIisFlag: Bool
    
    let forQualInvestorFlag: Bool
    
    let weekendFlag: Bool
    
    let blockedTcaFlag: Bool
    
    let firstOneMinCandleDate: Date
    
    let firstOneDayCandleDate: Date
}

internal extension CurrencyModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Currency) throws {
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
    func toModel() throws -> CurrencyModel {
        try CurrencyModel(grpcModel: self)
    }
}
