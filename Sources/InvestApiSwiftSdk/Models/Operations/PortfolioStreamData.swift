import GRPC

public struct PortfolioStreamData {
    private let call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse>
    
    internal init(_ call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse>) {
        self.call = call
    }
    
    public func cancel() -> Void {
        call.cancel(promise: nil)
    }
}
