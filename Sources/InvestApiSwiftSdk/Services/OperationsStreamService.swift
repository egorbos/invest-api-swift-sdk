import NIOCore
import Foundation

/// Сервис получения информации о портфеле в реальном времени.
public protocol OperationsStreamService {
    /// Поток обновлений портфеля.
    ///
    /// - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    /// - Returns: Поток обновлений портфеля `PortfolioStreamData`.
    func portfolioStream(accounts: [String], handler: @escaping (PortfolioStreamPayload) -> Void) -> PortfolioStreamData
    
    /// Поток информации по изменению позиций портфеля.
    ///
    /// - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    /// - Returns: Поток информации по изменению позиций портфеля `PositionsStreamData`.
    func positionsStream(accounts: [String], handler: @escaping (PositionsStreamPayload) -> Void) -> PositionsStreamData
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Поток обновлений портфеля.
    ///
    /// - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    /// - Returns: Асинхронный поток обновлений портфеля `PortfolioAsyncStreamData`.
    func portfolioStream(accounts: [String]) async -> PortfolioAsyncStreamData
    
    /// Поток информации по изменению позиций портфеля.
    ///
    /// - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    /// - Returns: Асинхронный поток информации по изменению позиций портфеля `PositionsAsyncStreamData`.
    func positionsStream(accounts: [String]) async -> PositionsAsyncStreamData
#endif
}

internal struct GrpcOperationsStreamService: OperationsStreamService {
    let client: OperationsStreamServiceClient
    
    init(_ client: OperationsStreamServiceClient) {
        self.client = client
    }
    
    func portfolioStream(accounts: [String], handler: @escaping (PortfolioStreamPayload) -> Void) -> PortfolioStreamData {
        let call = self.client.portfolioStream(.new(accounts: accounts)) { response in
            handler(PortfolioStreamPayload(response: response))
        }
        return PortfolioStreamData(call)
    }
    
    func positionsStream(accounts: [String], handler: @escaping (PositionsStreamPayload) -> Void) -> PositionsStreamData {
        let call = self.client.positionsStream(.new(accounts: accounts)) { response in
            handler(PositionsStreamPayload(response: response))
        }
        return PositionsStreamData(call)
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func portfolioStream(accounts: [String]) async -> PortfolioAsyncStreamData {
        PortfolioAsyncStreamData(self.client.portfolioStream(.new(accounts: accounts)))
    }
    
    func positionsStream(accounts: [String]) async -> PositionsAsyncStreamData {
        PositionsAsyncStreamData(self.client.positionsStream(.new(accounts: accounts)))
    }
#endif
}
