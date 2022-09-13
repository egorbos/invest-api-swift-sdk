import GRPC
import Foundation

public protocol MarketDataServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_MarketDataServiceClientProtocol {
    var interceptors: MarketDataServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: MarketDataServiceClientInterceptorFactory
    )
}

public protocol MarketDataServiceAsyncClient:
    MarketDataServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_MarketDataServiceAsyncClientProtocol {
}

internal struct DefaultMarketDataServiceAsyncClient: MarketDataServiceAsyncClient {
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
