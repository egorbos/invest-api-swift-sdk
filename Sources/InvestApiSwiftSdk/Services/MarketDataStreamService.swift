/// Сервис получения биржевой информации в реальном времени.
public protocol MarketDataStreamService {
    /// Поток предоставления биржевой информации.
    ///
    /// - Parameter handler: Обработчик событий поступления сообщений из потока.
    ///
    /// - Returns: Поток биржевой информации `MarketDataStream`.
    func stream(handler: @escaping (any StreamData) -> Void) -> MarketDataStream
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Поток предоставления биржевой информации.
    ///
    /// - Returns: Асинхронный поток биржевой информации `MarketDataAsyncStream`.
    func stream() -> MarketDataAsyncStream
#endif
}

internal struct GrpcMarketDataStreamService: MarketDataStreamService {
    let client: MarketDataStreamServiceClient
    
    init(_ client: MarketDataStreamServiceClient) {
        self.client = client
    }
    
    func stream(handler: @escaping (any StreamData) -> Void) -> MarketDataStream {
        let call = self.client.marketDataStream { response in
            handler(response.transform())
        }
        return MarketDataStream(call)
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func stream() -> MarketDataAsyncStream {
        MarketDataAsyncStream(self.client.makeMarketDataStreamCall())
    }
#endif
}
