import GRPC

internal struct SandboxServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: SandboxServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = SandboxServiceClientInterceptorFactory()
    }
}
