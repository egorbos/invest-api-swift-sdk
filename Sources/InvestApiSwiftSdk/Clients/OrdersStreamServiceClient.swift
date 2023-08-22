import GRPC

internal struct OrdersStreamServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_OrdersStreamServiceClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_OrdersStreamServiceClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: OrdersStreamServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = OrdersStreamServiceClientInterceptorFactory()
    }
}
