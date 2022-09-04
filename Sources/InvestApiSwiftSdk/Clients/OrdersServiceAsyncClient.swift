import GRPC
import Foundation

internal final class OrdersServiceAsyncClient: Tinkoff_Public_Invest_Api_Contract_V1_OrdersServiceAsyncClientProtocol {
    public var channel: GRPCChannel
    public var defaultCallOptions: CallOptions
    public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_OrdersServiceClientInterceptorFactoryProtocol?

    public init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions = CallOptions(),
      interceptors: Tinkoff_Public_Invest_Api_Contract_V1_OrdersServiceClientInterceptorFactoryProtocol? = nil
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
