#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public final class CommonAsyncStreamWrapper<Stream>: AsyncStreamWrapper<CommonApiClient, Stream> {
    // MARK: Сервис получения информации о портфеле в реальном времени.
    
    /// Возвращает экземпляр `CommonAsyncStreamWrapper` для получения потока обновлений портфеля.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `CommonAsyncStreamWrapper`.
    public static func portfolio(accounts: [String]) -> CommonAsyncStreamWrapper<PortfolioAsyncStream> {
        .init {
            return $0.operationsStream.portfolioStream(accounts: accounts)
        }
    }
    
    /// Возвращает экземпляр `CommonAsyncStreamWrapper` для получения потока информации по изменению позиций портфеля.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `CommonAsyncStreamWrapper`.
    public static func positions(accounts: [String]) -> CommonAsyncStreamWrapper<PositionsAsyncStream> {
        .init {
            return $0.operationsStream.positionsStream(accounts: accounts)
        }
    }
    
    // MARK: Сервис получения биржевой информации в реальном времени.
    
    /// Экземпляр `CommonAsyncStreamWrapper` для получения потока предоставления биржевой информации.
    public static var market: CommonAsyncStreamWrapper<MarketDataAsyncStream> {
        .init {
            return $0.marketDataStream.stream()
        }
    }
    
    // MARK: Сервис работы с торговыми поручениями в реальном времени.
    
    /// Возвращает экземпляр `CommonAsyncStreamWrapper` для получения маржинальных показателей по счёту пользователя.
    ///
    ///  - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    ///  - Returns: Экземпляр `CommonAsyncStreamWrapper`.
    public static func trades(accounts: [String]) -> CommonAsyncStreamWrapper<OrdersAsyncStream> {
        .init {
            return $0.ordersStream.tradesStream(accounts: accounts)
        }
    }
}
#endif
