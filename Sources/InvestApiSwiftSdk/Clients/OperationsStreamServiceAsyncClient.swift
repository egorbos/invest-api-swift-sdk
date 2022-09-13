import GRPC
import Foundation

public protocol OperationsStreamServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_OperationsStreamServiceClientProtocol {
    var interceptors: OperationsStreamServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: OperationsStreamServiceClientInterceptorFactory
    )
}

public protocol OperationsStreamServiceAsyncClient:
    OperationsStreamServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_OperationsStreamServiceAsyncClientProtocol {
}

internal struct DefaultOperationsStreamServiceAsyncClient: OperationsStreamServiceAsyncClient {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: OperationsStreamServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: OperationsStreamServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
