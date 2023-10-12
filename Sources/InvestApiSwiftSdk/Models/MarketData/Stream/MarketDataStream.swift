import GRPC

/// Поток биржевой информации.
public struct MarketDataStream {
    private let call: BidirectionalStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest, Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse>
    
    internal init(_ call: BidirectionalStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest, Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse>) {
        self.call = call
    }
    
    /// Отправляет в поток запрос на подписку / отписку.
    ///
    /// - Parameter request: Экземпляр запроса `MarketDataStreamRequest`.
    public func send(_ request: MarketDataStreamRequest) -> Void {
        let requests = request.transformToRequestsForCall()
        _ = call.sendMessages(requests)
    }
    
    /// Разрывает соединение с сервером.
    public func cancel() -> Void {
        call.cancel(promise: nil)
    }
}
