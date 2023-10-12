import GRPC

/// Поток информации об обновлении портфеля.
public struct PortfolioStream {
    private let call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse>
    
    internal init(_ call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse>) {
        self.call = call
    }
    
    /// Разрывает соединение с сервером.
    public func cancel() -> Void {
        call.cancel(promise: nil)
    }
}
