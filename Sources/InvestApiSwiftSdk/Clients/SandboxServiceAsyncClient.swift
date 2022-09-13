import GRPC
import Foundation

public protocol SandboxServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceClientProtocol {
    var interceptors: SandboxServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: SandboxServiceClientInterceptorFactory
    )
}

public protocol SandboxServiceAsyncClient:
    SandboxServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceAsyncClientProtocol {
}

internal struct DefaultSandboxServiceAsyncClient: SandboxServiceAsyncClient {
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
