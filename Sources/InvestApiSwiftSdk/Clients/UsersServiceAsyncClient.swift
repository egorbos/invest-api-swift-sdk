import GRPC
import Foundation

public protocol UsersServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientProtocol {
    var interceptors: UsersServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: UsersServiceClientInterceptorFactory
    )
}

public protocol UsersServiceAsyncClient:
    UsersServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceAsyncClientProtocol {
}

internal struct DefaultUsersServiceAsyncClient: UsersServiceAsyncClient {
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
