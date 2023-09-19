import GRPC
import NIOCore
import Foundation

/// Сервис работы с торговыми поручениями в реальном времени.
public protocol OrdersStreamService {
    /// Поток сделок пользователя.
    ///
    /// - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    /// - Returns: Поток сделок пользователя `OrdersStreamData`.
    func tradesStream(accounts: [String], handler: @escaping (TradesStreamPayload) -> Void) throws -> OrdersStreamData
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Поток сделок пользователя.
    ///
    /// - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    /// - Returns: Асинхронный поток сделок пользователя `OrdersAsyncStreamData`.
    func tradesStream(accounts: [String]) async throws -> OrdersAsyncStreamData
#endif
}

internal struct GrpcOrdersStreamService: OrdersStreamService {
    let client: OrdersStreamServiceClient
    
    init(_ client: OrdersStreamServiceClient) {
        self.client = client
    }
    
    func tradesStream(accounts: [String], handler: @escaping (TradesStreamPayload) -> Void) throws -> OrdersStreamData {
        let call = self.client.tradesStream(.new(accounts: accounts)) { response in
            handler(TradesStreamPayload(response: response))
        }
        return OrdersStreamData(call)
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func tradesStream(accounts: [String]) async throws -> OrdersAsyncStreamData {
        OrdersAsyncStreamData(self.client.tradesStream(.new(accounts: accounts)))
    }
#endif
}
