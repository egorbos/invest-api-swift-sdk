import GRPC
import Foundation

internal final class MarketDataStreamServiceAsyncClient: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataStreamServiceAsyncClientProtocol {
    public var channel: GRPCChannel
    public var defaultCallOptions: CallOptions
    public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataStreamServiceClientInterceptorFactoryProtocol?

    public init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions = CallOptions(),
      interceptors: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataStreamServiceClientInterceptorFactoryProtocol? = nil
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
