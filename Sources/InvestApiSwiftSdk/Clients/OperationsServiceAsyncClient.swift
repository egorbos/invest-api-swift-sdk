import GRPC
import Foundation

public protocol OperationsServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_OperationsServiceClientProtocol {
    var interceptors: OperationsServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: OperationsServiceClientInterceptorFactory
    )
}

public protocol OperationsServiceAsyncClient:
    OperationsServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_OperationsServiceAsyncClientProtocol {
}

internal struct DefaultOperationsServiceAsyncClient: OperationsServiceAsyncClient {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: OperationsServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: OperationsServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
