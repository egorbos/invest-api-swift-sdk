public final class CommonStreamWrapper<Stream>: StreamWrapper<CommonApiClient, Stream> {
    // MARK: Сервис получения информации о портфеле в реальном времени.
    
    /// Возвращает экземпляр `CommonStreamWrapper` для получения потока обновлений портфеля.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `CommonStreamWrapper`.
    public static func portfolio(accounts: [String]) -> CommonStreamWrapper<PortfolioStream> {
        .init {
            return $0.operationsStream.portfolioStream(accounts: accounts, handler: $1)
        }
    }
    
    /// Возвращает экземпляр `CommonStreamWrapper` для получения потока информации по изменению позиций портфеля.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `CommonStreamWrapper`.
    public static func positions(accounts: [String]) -> CommonStreamWrapper<PositionsStream> {
        .init {
            return $0.operationsStream.positionsStream(accounts: accounts, handler: $1)
        }
    }
    
    // MARK: Сервис получения биржевой информации в реальном времени.
    
    /// Экземпляр `CommonStreamWrapper` для получения потока предоставления биржевой информации.
    public static var market: CommonStreamWrapper<MarketDataStream> {
        .init {
            return $0.marketDataStream.stream(handler: $1)
        }
    }
    
    // MARK: Сервис работы с торговыми поручениями в реальном времени.
    
    /// Возвращает экземпляр `CommonStreamWrapper` для получения маржинальных показателей по счёту пользователя.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `CommonStreamWrapper`.
    public static func trades(accounts: [String]) -> CommonStreamWrapper<OrdersStream> {
        .init {
            return $0.ordersStream.tradesStream(accounts: accounts, handler: $1)
        }
    }
}
