import Foundation

public class CommonApiRequest<Result>: ApiRequest<CommonApiClient, Result> {
    
    // MARK: Сервис предоставления справочной информации о пользователе.
    
    /// Экземпляр `CommonApiRequest` для получения счетов пользователя.
    public static var getAccounts: CommonApiRequest<[Account]> {
        .init {
            try $0.user.getAccounts()
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения маржинальных показателей по счёту пользователя.
    ///
    ///  - parameters:
    ///      - accountId: Идентификатор счёта пользователя.
    public static func getMarginAttributes(accountId id: String) -> CommonApiRequest<MarginAttributes> {
        .init {
            try $0.user.getMarginAttributes(accountId: id)
        }
    }
    
    /// Экземпляр `CommonApiRequest` для получения лимитов запросов пользователя.
    public static var getUserTariff: CommonApiRequest<UserTariff> {
        .init {
            try $0.user.getUserTariff()
        }
    }
    
    /// Экземпляр `CommonApiRequest` для получения информации о статусе пользователя.
    public static var getInfo: CommonApiRequest<UserInfo> {
        .init {
            try $0.user.getInfo()
        }
    }
    
    // MARK: Сервис получения биржевой информации.
    
    /// Возвращает экземпляр `CommonApiRequest` для получения исторических свечей по инструменту.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///      - interval: Интервал запрашиваемых свечей.
    public static func getCandles(
        figi: String,
        from: Date,
        to: Date,
        interval: CandleInterval
    ) -> CommonApiRequest<[HistoricalCandle]> {
        .init {
            try $0.marketData.getCandles(figi: figi, from: from, to: to, interval: interval)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения последних цен по инструментам.
    ///
    ///  - parameters:
    ///      - figis: Figi идентификаторы инструментов.
    public static func getLastPrices(figis: [String]) -> CommonApiRequest<[LastPrice]> {
        .init {
            try $0.marketData.getLastPrices(figis: figis)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для оплучения стакана по инструменту.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    public static func getOrderBook(figi: String, depth: Int32) throws -> CommonApiRequest<OrderBookInfo> {
        .init {
            try $0.marketData.getOrderBook(figi: figi, depth: depth)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения статуса торгов по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    public static func getTradingStatus(figi: String) throws -> CommonApiRequest<TradingStatusInfo> {
        .init {
            try $0.marketData.getTradingStatus(figi: figi)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения обезличенных сделок за последний час.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    public static func getLastTrades(
        figi: String,
        from: Date,
        to: Date
    ) throws -> CommonApiRequest<[Trade]> {
        .init {
            try $0.marketData.getLastTrades(figi: figi, from: from, to: to)
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения цен закрытия торговой сессии по инструментам.
    ///
    ///  - parameters:
    ///      - figis: Figi идентификаторы инструментов.
    public static func getClosePrices(figis: [String]) throws -> CommonApiRequest<[InstrumentClosePrice]> {
        .init {
            try $0.marketData.getClosePrices(figis: figis)
        }
    }
}
