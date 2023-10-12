import GRPC

/// Поток сделок пользователя.
public struct OrdersStream {
    private let call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse>
    
    internal init(_ call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse>) {
        self.call = call
    }
    
    /// Разрывает соединение с сервером.
    public func cancel() -> Void {
        call.cancel(promise: nil)
    }
}
