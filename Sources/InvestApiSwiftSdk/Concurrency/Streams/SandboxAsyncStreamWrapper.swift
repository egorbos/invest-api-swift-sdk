#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public final class SandboxAsyncStreamWrapper<Stream>: AsyncStreamWrapper<SandboxApiClient, Stream> {
    // MARK: Сервис получения информации о портфеле в реальном времени.
    
    /// Возвращает экземпляр `SandboxAsyncStreamWrapper` для получения потока обновлений портфеля.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncStreamWrapper`.
    public static func portfolio(accounts: [String]) -> SandboxAsyncStreamWrapper<PortfolioAsyncStream> {
        .init {
            return $0.operationsStream.portfolioStream(accounts: accounts)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncStreamWrapper` для получения потока информации по изменению позиций портфеля.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncStreamWrapper`.
    public static func positions(accounts: [String]) -> SandboxAsyncStreamWrapper<PositionsAsyncStream> {
        .init {
            return $0.operationsStream.positionsStream(accounts: accounts)
        }
    }
    
    // MARK: Сервис получения биржевой информации в реальном времени.
    
    /// Экземпляр `SandboxAsyncStreamWrapper` для получения потока предоставления биржевой информации.
    public static var market: SandboxAsyncStreamWrapper<MarketDataAsyncStream> {
        .init {
            return $0.marketDataStream.stream()
        }
    }
    
    // MARK: Сервис работы с торговыми поручениями в реальном времени.
    
    /// Возвращает экземпляр `SandboxAsyncStreamWrapper` для получения маржинальных показателей по счёту пользователя.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncStreamWrapper`.
    public static func trades(accounts: [String]) -> SandboxAsyncStreamWrapper<OrdersAsyncStream> {
        .init {
            return $0.ordersStream.tradesStream(accounts: accounts)
        }
    }
}
#endif
