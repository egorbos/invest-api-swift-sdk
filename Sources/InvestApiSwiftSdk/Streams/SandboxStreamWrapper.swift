public final class SandboxStreamWrapper<Stream>: StreamWrapper<SandboxApiClient, Stream> {
    // MARK: Сервис получения информации о портфеле в реальном времени.
    
    /// Возвращает экземпляр `SandboxStreamWrapper` для получения потока обновлений портфеля.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `SandboxStreamWrapper`.
    public static func portfolio(accounts: [String]) -> SandboxStreamWrapper<PortfolioStream> {
        .init {
            return $0.operationsStream.portfolioStream(accounts: accounts, handler: $1)
        }
    }
    
    /// Возвращает экземпляр `SandboxStreamWrapper` для получения потока информации по изменению позиций портфеля.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `SandboxStreamWrapper`.
    public static func positions(accounts: [String]) -> SandboxStreamWrapper<PositionsStream> {
        .init {
            return $0.operationsStream.positionsStream(accounts: accounts, handler: $1)
        }
    }
    
    // MARK: Сервис получения биржевой информации в реальном времени.
    
    /// Экземпляр `SandboxStreamWrapper` для получения потока предоставления биржевой информации.
    public static var market: SandboxStreamWrapper<MarketDataStream> {
        .init {
            return $0.marketDataStream.stream(handler: $1)
        }
    }
    
    // MARK: Сервис работы с торговыми поручениями в реальном времени.
    
    /// Возвращает экземпляр `SandboxStreamWrapper` для получения маржинальных показателей по счёту пользователя.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `SandboxStreamWrapper`.
    public static func trades(accounts: [String]) -> SandboxStreamWrapper<OrdersStream> {
        .init {
            return $0.ordersStream.tradesStream(accounts: accounts, handler: $1)
        }
    }
}

