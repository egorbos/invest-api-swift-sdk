#if compiler(>=5.5) && canImport(_Concurrency)
import GRPC

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct MarketDataAsyncStream: AsyncSequence {
    public typealias Element = any StreamData
    public typealias AsyncIterator = AsyncStreamIterator
        <Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse, any StreamData>
    
    private let call: GRPCAsyncBidirectionalStreamingCall
        <Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest,
            Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse>
    
    init(_ call: GRPCAsyncBidirectionalStreamingCall
         <Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest,
            Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse>)
    {
        self.call = call
    }
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncStreamIterator(iterator: call.responseStream.makeAsyncIterator()) { $0!.transform() }
    }
    
    /// Отправляет в поток запрос на подписку / отписку.
    ///
    /// - Parameter request: Экземпляр запроса `MarketDataStreamRequest`.
    public func send(_ request: MarketDataStreamRequest) async throws -> Void {
        let requests = request.transformToRequestsForCall()
        try await call.requestStream.send(requests)
    }
}
#endif
