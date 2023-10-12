/// Сервис получения информации о портфеле в реальном времени.
public protocol OperationsStreamService {
    /// Поток обновлений портфеля.
    ///
    /// - Parameters:
    ///     - accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///     - handler: Обработчик событий поступления сообщений из потока.
    ///
    /// - Returns: Поток обновлений портфеля `PortfolioStream`.
    func portfolioStream(accounts: [String], handler: @escaping (any StreamData) -> Void) -> PortfolioStream
    
    /// Поток информации по изменению позиций портфеля.
    ///
    /// - Parameters:
    ///     - accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///     - handler: Обработчик событий поступления сообщений из потока.
    ///
    /// - Returns: Поток информации по изменению позиций портфеля `PositionsStream`.
    func positionsStream(accounts: [String], handler: @escaping (any StreamData) -> Void) -> PositionsStream
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Поток обновлений портфеля.
    ///
    /// - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    /// - Returns: Асинхронный поток обновлений портфеля `PortfolioAsyncStream`.
    func portfolioStream(accounts: [String]) -> PortfolioAsyncStream
    
    /// Поток информации по изменению позиций портфеля.
    ///
    /// - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    /// - Returns: Асинхронный поток информации по изменению позиций портфеля `PositionsAsyncStream`.
    func positionsStream(accounts: [String]) -> PositionsAsyncStream
#endif
}

internal struct GrpcOperationsStreamService: OperationsStreamService {
    let client: OperationsStreamServiceClient
    
    init(_ client: OperationsStreamServiceClient) {
        self.client = client
    }
    
    func portfolioStream(accounts: [String], handler: @escaping (any StreamData) -> Void) -> PortfolioStream {
        let call = self.client.portfolioStream(.new(accounts: accounts)) { response in
            handler(response.transform())
        }
        return PortfolioStream(call)
    }
    
    func positionsStream(accounts: [String], handler: @escaping (any StreamData) -> Void) -> PositionsStream {
        let call = self.client.positionsStream(.new(accounts: accounts)) { response in
            handler(response.transform())
        }
        return PositionsStream(call)
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func portfolioStream(accounts: [String]) -> PortfolioAsyncStream {
        PortfolioAsyncStream(self.client.portfolioStream(.new(accounts: accounts)))
    }
    
    func positionsStream(accounts: [String]) -> PositionsAsyncStream {
        PositionsAsyncStream(self.client.positionsStream(.new(accounts: accounts)))
    }
#endif
}
