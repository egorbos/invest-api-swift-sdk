import GRPC
import Foundation

public protocol MarketDataStreamServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_MarketDataStreamServiceClientProtocol {
    var interceptors: MarketDataStreamServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: MarketDataStreamServiceClientInterceptorFactory
    )
}

public protocol MarketDataStreamServiceAsyncClient:
    MarketDataStreamServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_MarketDataStreamServiceAsyncClientProtocol {
}

internal struct DefaultMarketDataStreamServiceAsyncClient: MarketDataStreamServiceAsyncClient {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: MarketDataStreamServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: MarketDataStreamServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
