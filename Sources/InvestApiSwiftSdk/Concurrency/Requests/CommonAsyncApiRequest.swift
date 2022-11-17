#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public class CommonAsyncApiRequest<Result>: AsyncApiRequest<CommonApiClient, Result> {
    
    // MARK: Сервис предоставления справочной информации о пользователе.
    
    /// Экземпляр `CommonAsyncApiRequest` для получения счетов пользователя.
    public static var getAccounts: CommonAsyncApiRequest<[Account]> {
        .init {
            try await $0.user.getAccounts()
        }
    }
    
    /// Возвращает экземпляр `CommonAsyncApiRequest` для получения маржинальных показателей по счёту пользователя.
    ///
    ///  - parameters:
    ///      - accountId: Идентификатор счёта пользователя.
    public static func getMarginAttributes(accountId id: String) -> CommonAsyncApiRequest<MarginAttributes> {
        .init {
            try await $0.user.getMarginAttributes(accountId: id)
        }
    }

    /// Экземпляр `CommonAsyncApiRequest` для получения лимитов запросов пользователя.
    public static var getUserTariff: CommonAsyncApiRequest<UserTariff> {
        .init {
            try await $0.user.getUserTariff()
        }
    }

    /// Экземпляр `CommonAsyncApiRequest` для получения информации о статусе пользователя.
    public static var getInfo: CommonAsyncApiRequest<UserInfo> {
        .init {
            try await $0.user.getInfo()
        }
    }
    
    // MARK: Сервис получения биржевой информации.
    
    /// Возвращает экземпляр `CommonAsyncApiRequest` для получения исторических свечей по инструменту.
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
    ) -> CommonAsyncApiRequest<[HistoricalCandle]> {
        .init {
            try await $0.marketData.getCandles(figi: figi, from: from, to: to, interval: interval)
        }
    }
    
    /// Возвращает экземпляр `CommonAsyncApiRequest` для получения последних цен по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификаторы инструментов.
    public static func getLastPrices(figi: [String]) -> CommonAsyncApiRequest<[LastPrice]> {
        .init {
            try await $0.marketData.getLastPrices(figi: figi)
        }
    }
    
    /// Возвращает экземпляр `CommonAsyncApiRequest` для оплучения стакана по инструменту.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    public static func getOrderBook(figi: String, depth: Int32) throws -> CommonAsyncApiRequest<OrderBookInfo> {
        .init {
            try await $0.marketData.getOrderBook(figi: figi, depth: depth)
        }
    }
    
    /// Возвращает экземпляр `CommonAsyncApiRequest` для получения статуса торгов по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    public static func getTradingStatus(figi: String) throws -> CommonAsyncApiRequest<TradingStatusInfo> {
        .init {
            try await $0.marketData.getTradingStatus(figi: figi)
        }
    }
    
    /// Возвращает экземпляр `CommonAsyncApiRequest` для получения обезличенных сделок за последний час.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    public static func getLastTrades(
        figi: String,
        from: Date,
        to: Date
    ) throws -> CommonAsyncApiRequest<[Trade]> {
        .init {
            try await $0.marketData.getLastTrades(figi: figi, from: from, to: to)
        }
    }
    
    /// Возвращает экземпляр `CommonAsyncApiRequest` для получения цен закрытия торговой сессии по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификаторы инструментов.
    public static func getClosePrices(figi: [String]) throws -> CommonAsyncApiRequest<[InstrumentClosePrice]> {
        .init {
            try await $0.marketData.getClosePrices(figi: figi)
        }
    }
}
#endif
