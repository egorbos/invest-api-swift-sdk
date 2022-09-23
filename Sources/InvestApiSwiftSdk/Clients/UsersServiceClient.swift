import GRPC

internal struct UsersServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: UsersServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: UsersServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
