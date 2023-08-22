import GRPC

internal struct MarketDataServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataServiceClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataServiceClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: MarketDataServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = MarketDataServiceClientInterceptorFactory()
    }
}
