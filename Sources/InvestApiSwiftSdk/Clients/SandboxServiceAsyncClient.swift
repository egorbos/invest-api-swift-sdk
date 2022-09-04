import GRPC
import Foundation

internal final class SandboxServiceAsyncClient: Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceAsyncClientProtocol {
    public var channel: GRPCChannel
    public var defaultCallOptions: CallOptions
    public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceClientInterceptorFactoryProtocol?

    public init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions = CallOptions(),
      interceptors: Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceClientInterceptorFactoryProtocol? = nil
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
