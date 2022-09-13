import GRPC
import Foundation

public protocol OrdersStreamServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_OrdersStreamServiceClientProtocol {
    var interceptors: OrdersStreamServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: OrdersStreamServiceClientInterceptorFactory
    )
}

public protocol OrdersStreamServiceAsyncClient:
    OrdersStreamServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_OrdersStreamServiceAsyncClientProtocol {
}

internal struct DefaultOrdersStreamServiceAsyncClient: OrdersStreamServiceAsyncClient {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: OrdersStreamServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: OrdersStreamServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
