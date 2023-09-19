#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public class SandboxAsyncApiRequest<Result>: AsyncApiRequest<SandboxApiClient, Result> {
    
    // MARK: Сервис предоставления справочной информации о пользователе.
    
    /// Экземпляр `SandboxAsyncApiRequest` для получения счетов пользователя.
    public static var getAccounts: SandboxAsyncApiRequest<[Account]> {
        .init {
            try await $0.user.getAccounts()
        }
    }

    /// Экземпляр `SandboxAsyncApiRequest` для получения лимитов запросов пользователя.
    public static var getUserTariff: SandboxAsyncApiRequest<UserTariff> {
        .init {
            try await $0.user.getUserTariff()
        }
    }

    /// Экземпляр `SandboxAsyncApiRequest` для получения информации о статусе пользователя.
    public static var getInfo: SandboxAsyncApiRequest<UserInfo> {
        .init {
            try await $0.user.getInfo()
        }
    }
    
    // MARK: Сервис для работы с песочницей.
    
    /// Экземпляр `SandboxAsyncApiRequest` для регистрации счёта в песочнице.
    public static var openSandboxAccount: SandboxAsyncApiRequest<String> {
        .init {
            try await $0.sandbox.openSandboxAccount()
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для закрытия счёта в песочнице.
    ///
    ///  - Parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    public static func closeSandboxAccount(accountId id: String) -> SandboxAsyncApiRequest<Void> {
        .init {
            try await $0.sandbox.closeSandboxAccount(accountId: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для пополнения счёта в песочнице.
    ///
    ///  - Parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    ///      - amount: Сумма пополнения счёта в рублях.
    public static func sandboxPayIn(accountId id: String, amount: MoneyValue) -> SandboxAsyncApiRequest<MoneyValue> {
        .init {
            try await $0.sandbox.sandboxPayIn(accountId: id, amount: amount)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения доступного остатка для вывода средств в песочнице.
    ///
    ///  - Parameter accountId: Идентификатор счёта песочницы.
    public static func getSandboxWithdrawLimits(accountId id: String) -> SandboxAsyncApiRequest<WithdrawLimits> {
        .init {
            try await $0.sandbox.getSandboxWithdrawLimits(accountId: id)
        }
    }
    
    // MARK: Сервис получения биржевой информации.
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения исторических свечей по инструменту.
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
    ) -> SandboxAsyncApiRequest<[HistoricalCandle]> {
        .init {
            try await $0.marketData.getCandles(figi: figi, from: from, to: to, interval: interval)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения последних цен по инструментам.
    ///
    ///  - parameters:
    ///      - figis: Figi идентификаторы инструментов.
    public static func getLastPrices(figis: [String]) -> SandboxAsyncApiRequest<[LastPrice]> {
        .init {
            try await $0.marketData.getLastPrices(figis: figis)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для оплучения стакана по инструменту.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    public static func getOrderBook(figi: String, depth: Int32) throws -> SandboxAsyncApiRequest<OrderBookInfo> {
        .init {
            try await $0.marketData.getOrderBook(figi: figi, depth: depth)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения статуса торгов по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    public static func getTradingStatus(figi: String) throws -> SandboxAsyncApiRequest<TradingStatusInfo> {
        .init {
            try await $0.marketData.getTradingStatus(figi: figi)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения обезличенных сделок за последний час.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    public static func getLastTrades(
        figi: String,
        from: Date,
        to: Date
    ) throws -> SandboxAsyncApiRequest<[Trade]> {
        .init {
            try await $0.marketData.getLastTrades(figi: figi, from: from, to: to)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения цен закрытия торговой сессии по инструментам.
    ///
    ///  - parameters:
    ///      - figis: Figi идентификаторы инструментов.
    public static func getClosePrices(figis: [String]) throws -> SandboxAsyncApiRequest<[InstrumentClosePrice]> {
        .init {
            try await $0.marketData.getClosePrices(figis: figis)
        }
    }
}
#endif
