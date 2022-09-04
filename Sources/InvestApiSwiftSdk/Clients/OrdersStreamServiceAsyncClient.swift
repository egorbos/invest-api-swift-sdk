import GRPC
import Foundation

internal final class OrdersStreamServiceAsyncClient: Tinkoff_Public_Invest_Api_Contract_V1_OrdersStreamServiceAsyncClientProtocol {
    public var channel: GRPCChannel
    public var defaultCallOptions: CallOptions
    public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_OrdersStreamServiceClientInterceptorFactoryProtocol?

    public init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions = CallOptions(),
      interceptors: Tinkoff_Public_Invest_Api_Contract_V1_OrdersStreamServiceClientInterceptorFactoryProtocol? = nil
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
