import GRPC

internal struct MarketDataStreamServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataStreamServiceClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataStreamServiceClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: MarketDataStreamServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = MarketDataStreamServiceClientInterceptorFactory()
    }
}
