import GRPC

internal struct OperationsServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_OperationsServiceClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_OperationsServiceClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: OperationsServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = OperationsServiceClientInterceptorFactory()
    }
}
