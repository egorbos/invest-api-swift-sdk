import GRPC
import Foundation

public protocol InstrumentsServiceClient:
    Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsServiceClientProtocol {
    var interceptors: InstrumentsServiceClientInterceptorFactory { get }
    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: InstrumentsServiceClientInterceptorFactory
    )
}

public protocol InstrumentsServiceAsyncClient:
    InstrumentsServiceClient,
    Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsServiceAsyncClientProtocol {
}

internal struct DefaultInstrumentsServiceAsyncClient: InstrumentsServiceAsyncClient {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    let interceptors: InstrumentsServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions,
      interceptors: InstrumentsServiceClientInterceptorFactory
    ) {
      self.channel = channel
      self.defaultCallOptions = defaultCallOptions
      self.interceptors = interceptors
    }
}
