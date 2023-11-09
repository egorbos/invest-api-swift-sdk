import Foundation

/// Информация об опционном контракте.
public protocol Option {
    /// Уникальный идентификатор инструмента.
    var uid: String { get }
    
    /// Уникальный идентификатор позиции инструмента.
    var positionUid: String { get }
    
    /// Тикер инструмента.
    var ticker: String { get }
    
    /// Класс-код (секция торгов).
    var classCode: String { get }
    
    /// Уникальный идентификатор позиции базового актива.
    var basicAssetPositionUid: String { get }
    
    /// Текущий режим торгов инструмента.
    var tradingStatus: SecurityTradingStatus { get }
    
    /// Реальная площадка исполнения расчётов (биржа).
    var realExchange: RealExchange { get }
    
    /// Направление контракта.
    var direction: OptionDirection { get }
    
    /// Тип расчетов по контракту.
    var paymentType: OptionPaymentType { get }
    
    /// Стиль контракта.
    var style: OptionStyle { get }
    
    /// Тип опционного контракта.
    var contractType: OptionContractType { get }
    
    /// Название инструмента.
    var name: String { get }
    
    /// Валюта расчётов.
    var currency: CurrencyType { get }
    
    /// Валюта, в которой оценивается контракт.
    var settlementCurrency: String { get }
    
    /// Тип базового актива.
    var assetType: ContractAssetType { get }
    
    /// Базовый актив.
    var basicAsset: String { get }
    
    /// Размер базового актива.
    var basicAssetSize: Quotation { get }
    
    /// Tорговая площадка (секция биржи).
    var exchange: String { get }
    
    /// Код страны риска (в которой компания ведёт основной бизнес).
    var countryOfRisk: String { get }
    
    /// Наименование страны риска (в которой компания ведёт основной бизнес).
    var countryOfRiskName: String { get }
    
    /// Сектор экономики.
    var sector: String { get }
    
    /// Лотность инструмента (возможно совершение операций только на количества ценной бумаги, кратные параметру lot).
    var lot: Int32 { get }
    
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
    
    /// Шаг цены.
    var minPriceIncrement: Quotation { get }
    
    /// Цена страйка (по которой покупатель опциона может купить 'колл' или продать 'пут' базовый актив).
    var strikePrice: MoneyValue { get }
    
    /// Дата экспирации контракта в часов поясе UTC.
    var expirationDate: Date { get }
    
    /// Дата начала обращения контракта в часовом поясе UTC.
    var firstTradeDate: Date { get }
    
    /// Дата исполнения контракта в часовом поясе UTC.
    var lastTradeDate: Date { get }
    
    /// Признак доступности для операций в шорт.
    var shortEnabledFlag: Bool { get }
    
    /// Признак доступности для ИИС.
    var forIisFlag: Bool { get }
    
    /// Признак внебиржевой ценной бумаги.
    var otcFlag: Bool { get }
    
    /// Признак доступности для покупки.
    var buyAvailableFlag: Bool { get }
    
    /// Признак доступности для продажи.
    var sellAvailableFlag: Bool { get }
    
    /// Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    var forQualInvestorFlag: Bool { get }
    
    /// Флаг отображающий доступность торговли инструментом по выходным.
    var weekendFlag: Bool { get }
    
    /// Флаг заблокированного ТКС.
    var blockedTcaFlag: Bool { get }
    
    /// Параметр указывает на возможность торговать инструментом через API.
    var apiTradeAvailableFlag: Bool { get }
   
    /// Дата первой минутной свечи.
    var firstOneMinCandleDate: Date { get }
    
    /// Дата первой дневной свечи.
    var firstOneDayCandleDate: Date { get }
}

internal struct OptionModel: Option {
    let uid: String
    
    let positionUid: String
    
    let ticker: String
    
    let classCode: String
    
    let basicAssetPositionUid: String
    
    let tradingStatus: SecurityTradingStatus
    
    let realExchange: RealExchange
    
    let direction: OptionDirection
    
    let paymentType: OptionPaymentType
    
    let style: OptionStyle
    
    let contractType: OptionContractType
    
    let name: String
    
    let currency: CurrencyType
    
    let settlementCurrency: String
    
    let assetType: ContractAssetType
    
    let basicAsset: String
    
    let basicAssetSize: Quotation
    
    let exchange: String
    
    let countryOfRisk: String
    
    let countryOfRiskName: String
    
    let sector: String
    
    let lot: Int32
    
    let klong: Quotation
    
    let kshort: Quotation
    
    let dlong: Quotation
    
    let dshort: Quotation
    
    let dlongMin: Quotation
    
    let dshortMin: Quotation
    
    let minPriceIncrement: Quotation
    
    let strikePrice: MoneyValue
    
    let expirationDate: Date
    
    let firstTradeDate: Date
    
    let lastTradeDate: Date
    
    let shortEnabledFlag: Bool
    
    let forIisFlag: Bool
    
    let otcFlag: Bool
    
    let buyAvailableFlag: Bool
    
    let sellAvailableFlag: Bool
    
    let forQualInvestorFlag: Bool
    
    let weekendFlag: Bool
    
    let blockedTcaFlag: Bool
    
    let apiTradeAvailableFlag: Bool
    
    let firstOneMinCandleDate: Date
    
    let firstOneDayCandleDate: Date
}

internal extension OptionModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Option) throws {
        self.uid = grpcModel.uid
        self.positionUid = grpcModel.positionUid
        self.ticker = grpcModel.ticker
        self.classCode = grpcModel.classCode
        self.basicAssetPositionUid = grpcModel.basicAssetPositionUid
        self.tradingStatus = try .new(rawValue: grpcModel.tradingStatus.rawValue)
        self.realExchange = try .new(rawValue: grpcModel.realExchange.rawValue)
        self.direction = try .new(rawValue: grpcModel.direction.rawValue)
        self.paymentType = try .new(rawValue: grpcModel.paymentType.rawValue)
        self.style = try .new(rawValue: grpcModel.style.rawValue)
        self.contractType = try .new(rawValue: grpcModel.settlementType.rawValue)
        self.name = grpcModel.name
        self.currency = try .new(rawValue: grpcModel.currency)
        self.settlementCurrency = grpcModel.settlementCurrency
        self.assetType = try .new(rawValue: grpcModel.assetType)
        self.basicAsset = grpcModel.basicAsset
        self.basicAssetSize = grpcModel.basicAssetSize.toModel()
        self.exchange = grpcModel.exchange
        self.countryOfRisk = grpcModel.countryOfRisk
        self.countryOfRiskName = grpcModel.countryOfRiskName
        self.sector = grpcModel.sector
        self.lot = grpcModel.lot
        self.klong = grpcModel.klong.toModel()
        self.kshort = grpcModel.kshort.toModel()
        self.dlong = grpcModel.dlong.toModel()
        self.dshort = grpcModel.dshort.toModel()
        self.dlongMin = grpcModel.dlongMin.toModel()
        self.dshortMin = grpcModel.dshortMin.toModel()
        self.minPriceIncrement = grpcModel.minPriceIncrement.toModel()
        self.strikePrice = grpcModel.strikePrice.toModel()
        self.expirationDate = grpcModel.expirationDate.date
        self.firstTradeDate = grpcModel.firstTradeDate.date
        self.lastTradeDate = grpcModel.lastTradeDate.date
        self.shortEnabledFlag = grpcModel.shortEnabledFlag
        self.forIisFlag = grpcModel.forIisFlag
        self.otcFlag = grpcModel.otcFlag
        self.buyAvailableFlag = grpcModel.buyAvailableFlag
        self.sellAvailableFlag = grpcModel.sellAvailableFlag
        self.forQualInvestorFlag = grpcModel.forQualInvestorFlag
        self.weekendFlag = grpcModel.weekendFlag
        self.blockedTcaFlag = grpcModel.blockedTcaFlag
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
        self.firstOneMinCandleDate = grpcModel.first1MinCandleDate.date
        self.firstOneDayCandleDate = grpcModel.first1DayCandleDate.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Option {
    func toModel() throws -> OptionModel {
        try OptionModel(grpcModel: self)
    }
}
