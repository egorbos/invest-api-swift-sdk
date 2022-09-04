import GRPC
import Foundation

internal final class UsersServiceAsyncClient: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceAsyncClientProtocol {
    public var channel: GRPCChannel
    public var defaultCallOptions: CallOptions
    public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientInterceptorFactoryProtocol?

    public init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions = CallOptions(),
      interceptors: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientInterceptorFactoryProtocol? = nil
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
