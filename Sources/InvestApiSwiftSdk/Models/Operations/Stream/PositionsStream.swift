import GRPC

/// Поток информации по изменению позиций портфеля.
public struct PositionsStream {
    private let call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse>
    
    internal init(_ call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse>) {
        self.call = call
    }
    
    /// Разрывает соединение с сервером.
    public func cancel() -> Void {
        call.cancel(promise: nil)
    }
}
