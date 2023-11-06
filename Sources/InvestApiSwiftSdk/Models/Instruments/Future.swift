import Foundation

/// Информация о фьючерсном контракте.
public struct Future: Codable {
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Уникальный идентификатор инструмента.
    public let uid: String
    
    /// Тикер инструмента.
    public let ticker: String
    
    /// Класс-код (секция торгов).
    public let classCode: String
    
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
    
    /// Дата начала обращения контракта в часовом поясе UTC.
    public let firstTradeDate: Date
    
    /// Дата в часовом поясе UTC, до которой возможно проведение операций с контрактом.
    public let lastTradeDate: Date
    
    /// Тип фьючерсного контракта.
    public let contractType: FutureContractType
    
    /// Тип базового актива.
    public let assetType: ContractAssetType
    
    /// Базовый актив.
    public let basicAsset: String

    /// Размер базового актива.
    public let basicAssetSize: Quotation
    
    /// Код страны риска (в которой компания ведёт основной бизнес).
    public let countryOfRisk: String
    
    /// Наименование страны риска (в которой компания ведёт основной бизнес).
    public let countryOfRiskName: String
    
    /// Сектор экономики.
    public let sector: String
    
    /// Дата экспирации контракта в часов поясе UTC.
    public let expirationDate: Date
    
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
    
    /// Уникальный идентификатор позиции базового актива.
    public let basicAssetPositionUid: String
    
    /// Признак доступности для ИИС.
    public let forIisFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    public let forQualInvestorFlag: Bool
    
    /// Флаг отображающий доступность торговли инструментом по выходным.
    public let weekendFlag: Bool
    
    /// Флаг заблокированного ТКС.
    public let blockedTcaFlag: Bool
    
    /// Дата первой минутной свечи.
    public let firstOneMinCandleDate: Date
    
    /// Дата первой дневной свечи.
    public let firstOneDayCandleDate: Date
}

internal extension Future {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Future) throws {
        self.figi = grpcModel.figi
        self.uid = grpcModel.uid
        self.ticker = grpcModel.ticker
        self.classCode = grpcModel.classCode
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
        self.firstTradeDate = grpcModel.firstTradeDate.date
        self.lastTradeDate = grpcModel.lastTradeDate.date
        self.contractType = try .new(rawValue: grpcModel.futuresType)
        self.assetType = try .new(rawValue: grpcModel.assetType)
        self.basicAsset = grpcModel.basicAsset
        self.basicAssetSize = grpcModel.basicAssetSize.toModel()
        self.countryOfRisk = grpcModel.countryOfRisk
        self.countryOfRiskName = grpcModel.countryOfRiskName
        self.sector = grpcModel.sector
        self.expirationDate = grpcModel.expirationDate.date
        self.tradingStatus = try .new(rawValue: grpcModel.tradingStatus.rawValue)
        self.otcFlag = grpcModel.otcFlag
        self.buyAvailableFlag = grpcModel.buyAvailableFlag
        self.sellAvailableFlag = grpcModel.sellAvailableFlag
        self.minPriceIncrement = grpcModel.minPriceIncrement.toModel()
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
        self.realExchange = try .new(rawValue: grpcModel.realExchange.rawValue)
        self.positionUid = grpcModel.positionUid
        self.basicAssetPositionUid = grpcModel.basicAssetPositionUid
        self.forIisFlag = grpcModel.forIisFlag
        self.forQualInvestorFlag = grpcModel.forQualInvestorFlag
        self.weekendFlag = grpcModel.weekendFlag
        self.blockedTcaFlag = grpcModel.blockedTcaFlag
        self.firstOneMinCandleDate = grpcModel.first1MinCandleDate.date
        self.firstOneDayCandleDate = grpcModel.first1DayCandleDate.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Future {
    func toModel() throws -> Future {
        try Future(grpcModel: self)
    }
}
