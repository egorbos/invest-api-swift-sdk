import GRPC

public struct PositionsStreamData {
    private let call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse>
    
    internal init(_ call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse>) {
        self.call = call
    }
    
    public func cancel() -> Void {
        call.cancel(promise: nil)
    }
}
