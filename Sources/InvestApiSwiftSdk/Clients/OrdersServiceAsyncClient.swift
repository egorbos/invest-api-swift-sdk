import GRPC
import Foundation

public protocol OrdersServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_OrdersServiceClientProtocol {
    var interceptors: OrdersServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: OrdersServiceClientInterceptorFactory
    )
}

public protocol OrdersServiceAsyncClient:
    OrdersServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_OrdersServiceAsyncClientProtocol {
}

internal struct DefaultOrdersServiceAsyncClient: OrdersServiceAsyncClient {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: OrdersServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: OrdersServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
