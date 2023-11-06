import Foundation

/// Информация об опционном контракте.
public struct Option: Codable {
    /// Уникальный идентификатор инструмента.
    public let uid: String
    
    /// Уникальный идентификатор позиции инструмента.
    public let positionUid: String
    
    /// Тикер инструмента.
    public let ticker: String
    
    /// Класс-код (секция торгов).
    public let classCode: String
    
    /// Уникальный идентификатор позиции базового актива.
    public let basicAssetPositionUid: String
    
    /// Текущий режим торгов инструмента.
    public let tradingStatus: SecurityTradingStatus
    
    /// Реальная площадка исполнения расчётов (биржа).
    public let realExchange: RealExchange
    
    /// Направление контракта.
    public let direction: OptionDirection
    
    /// Тип расчетов по контракту.
    public let paymentType: OptionPaymentType
    
    /// Стиль контракта.
    public let style: OptionStyle
    
    /// Тип опционного контракта.
    public let contractType: OptionContractType
    
    /// Название инструмента.
    public let name: String
    
    /// Валюта расчётов.
    public let currency: CurrencyType
    
    /// Валюта, в которой оценивается контракт.
    public let settlementCurrency: String
    
    /// Тип базового актива.
    public let assetType: ContractAssetType
    
    /// Базовый актив.
    public let basicAsset: String
    
    /// Размер базового актива.
    public let basicAssetSize: Quotation
    
    /// Tорговая площадка (секция биржи).
    public let exchange: String
    
    /// Код страны риска (в которой компания ведёт основной бизнес).
    public let countryOfRisk: String
    
    /// Наименование страны риска (в которой компания ведёт основной бизнес).
    public let countryOfRiskName: String
    
    /// Сектор экономики.
    public let sector: String
    
    /// Лотность инструмента (возможно совершение операций только на количества ценной бумаги, кратные параметру lot).
    public let lot: Int32
    
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
    
    /// Шаг цены.
    public let minPriceIncrement: Quotation
    
    /// Цена страйка (по которой покупатель опциона может купить 'колл' или продать 'пут' базовый актив).
    public let strikePrice: MoneyValue
    
    /// Дата экспирации контракта в часов поясе UTC.
    public let expirationDate: Date
    
    /// Дата начала обращения контракта в часовом поясе UTC.
    public let firstTradeDate: Date
    
    /// Дата исполнения контракта в часовом поясе UTC.
    public let lastTradeDate: Date
    
    /// Признак доступности для операций в шорт.
    public let shortEnabledFlag: Bool
    
    /// Признак доступности для ИИС.
    public let forIisFlag: Bool
    
    /// Признак внебиржевой ценной бумаги.
    public let otcFlag: Bool
    
    /// Признак доступности для покупки.
    public let buyAvailableFlag: Bool
    
    /// Признак доступности для продажи.
    public let sellAvailableFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    public let forQualInvestorFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом по выходным.
    public let weekendFlag: Bool
    
    /// Флаг заблокированного ТКС.
    public let blockedTcaFlag: Bool
    
    /// Параметр указывает на возможность торговать инструментом через API.
    public let apiTradeAvailableFlag: Bool
   
    /// Дата первой минутной свечи.
    public let firstOneMinCandleDate: Date
    
    /// Дата первой дневной свечи.
    public let firstOneDayCandleDate: Date
}

internal extension Option {
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
    func toModel() throws -> Option {
        try Option(grpcModel: self)
    }
}
