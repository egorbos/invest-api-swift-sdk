import GRPC

internal struct MarketDataServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataServiceClientProtocol {    
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: MarketDataServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: MarketDataServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
