import GRPC

internal struct OperationsStreamServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_OperationsStreamServiceClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_OperationsStreamServiceClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: OperationsStreamServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = OperationsStreamServiceClientInterceptorFactory()
    }
}
