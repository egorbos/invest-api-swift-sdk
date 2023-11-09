/// Сервис работы с торговыми поручениями в реальном времени.
public protocol OrdersStreamService {
    /// Поток сделок пользователя.
    ///
    /// - Parameters:
    ///     - accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///     - handler: Обработчик событий поступления сообщений из потока.
    ///
    /// - Returns: Поток сделок пользователя `OrdersStream`.
    func tradesStream(accounts: [String], handler: @escaping (any StreamData) -> Void) -> OrdersStream
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Поток сделок пользователя.
    ///
    /// - Parameter accounts: Идентификаторы счетов на обновления которых необходимо подписаться.
    ///
    /// - Returns: Асинхронный поток сделок пользователя `OrdersAsyncStream`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func tradesStream(accounts: [String]) -> OrdersAsyncStream
#endif
}

internal struct GrpcOrdersStreamService: OrdersStreamService {
    let client: OrdersStreamServiceClient
    
    init(_ client: OrdersStreamServiceClient) {
        self.client = client
    }
    
    func tradesStream(accounts: [String], handler: @escaping (any StreamData) -> Void) -> OrdersStream {
        let call = self.client.tradesStream(.new(accounts: accounts)) { response in
            handler(response.transform())
        }
        return OrdersStream(call)
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func tradesStream(accounts: [String]) -> OrdersAsyncStream {
        OrdersAsyncStream(self.client.tradesStream(.new(accounts: accounts)))
    }
#endif
}
