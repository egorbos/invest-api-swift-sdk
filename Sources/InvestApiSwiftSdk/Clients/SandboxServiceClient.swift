import GRPC

internal struct SandboxServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: SandboxServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: SandboxServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
