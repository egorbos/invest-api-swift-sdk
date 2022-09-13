import GRPC
import Foundation

public protocol StopOrdersServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientProtocol {
    var interceptors: StopOrdersServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: StopOrdersServiceClientInterceptorFactory
    )
}

public protocol StopOrdersServiceAsyncClient:
    StopOrdersServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClientProtocol {
}

internal struct DefaultStopOrdersServiceAsyncClient: StopOrdersServiceAsyncClient {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: StopOrdersServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: StopOrdersServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
