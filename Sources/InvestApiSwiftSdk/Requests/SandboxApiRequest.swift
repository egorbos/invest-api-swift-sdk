import Foundation

public class SandboxApiRequest<Result>: ApiRequest<SandboxApiClient, Result> {
    
    // MARK: Сервис предоставления справочной информации о пользователе.

    /// Экземпляр `SandboxApiRequest` для получения счетов пользователя.
    public static var getAccounts: SandboxApiRequest<[Account]> {
        .init {
            try $0.user.getAccounts()
        }
    }
    
    /// Экземпляр `SandboxApiRequest` для получения лимитов запросов пользователя.
    public static var getUserTariff: SandboxApiRequest<UserTariff> {
        .init {
            try $0.user.getUserTariff()
        }
    }
    
    /// Экземпляр `SandboxApiRequest` для получения информации о статусе пользователя.
    public static var getInfo: SandboxApiRequest<UserInfo> {
        .init {
            try $0.user.getInfo()
        }
    }
    
    // MARK: Сервис для работы с песочницей.
    
    /// Экземпляр `SandboxApiRequest` для регистрации счёта в песочнице.
    public static var openSandboxAccount: SandboxApiRequest<String> {
        .init {
            try $0.sandbox.openSandboxAccount()
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для закрытия счёта в песочнице.
    ///
    ///  - Parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    public static func closeSandboxAccount(accountId id: String) -> SandboxApiRequest<Void> {
        .init {
            try $0.sandbox.closeSandboxAccount(accountId: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для пополнения счёта в песочнице.
    ///
    ///  - Parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    ///      - amount: Сумма пополнения счёта в рублях.
    public static func sandboxPayIn(accountId id: String, amount: MoneyValue) -> SandboxApiRequest<MoneyValue> {
        .init {
            try $0.sandbox.sandboxPayIn(accountId: id, amount: amount)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения доступного остатка для вывода средств в песочнице.
    ///
    ///  - Parameter accountId: Идентификатор счёта песочницы.
    public static func getSandboxWithdrawLimits(accountId id: String) -> SandboxApiRequest<WithdrawLimits> {
        .init {
            try $0.sandbox.getSandboxWithdrawLimits(accountId: id)
        }
    }
    
    // MARK: Сервис получения биржевой информации.
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения исторических свечей по инструменту.
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
    ) -> SandboxApiRequest<[HistoricalCandle]> {
        .init {
            try $0.marketData.getCandles(figi: figi, from: from, to: to, interval: interval)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения последних цен по инструментам.
    ///
    ///  - parameters:
    ///      - figis: Figi идентификаторы инструментов.
    public static func getLastPrices(figis: [String]) -> SandboxApiRequest<[LastPrice]> {
        .init {
            try $0.marketData.getLastPrices(figis: figis)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для оплучения стакана по инструменту.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    public static func getOrderBook(figi: String, depth: Int32) throws -> SandboxApiRequest<OrderBookInfo> {
        .init {
            try $0.marketData.getOrderBook(figi: figi, depth: depth)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения статуса торгов по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    public static func getTradingStatus(figi: String) throws -> SandboxApiRequest<TradingStatusInfo> {
        .init {
            try $0.marketData.getTradingStatus(figi: figi)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения обезличенных сделок за последний час.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    public static func getLastTrades(
        figi: String,
        from: Date,
        to: Date
    ) -> SandboxApiRequest<[Trade]> {
        .init {
            $0.marketData.getLastTrades(figi: figi, from: from, to: to)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения цен закрытия торговой сессии по инструментам.
    ///
    ///  - parameters:
    ///      - figis: Figi идентификаторы инструментов.
    public static func getClosePrices(figis: [String]) throws -> SandboxApiRequest<[InstrumentClosePrice]> {
        .init {
            try $0.marketData.getClosePrices(figis: figis)
        }
    }
}
