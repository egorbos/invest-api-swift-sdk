#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public protocol OrdersStreamServiceAsyncClient:
    Tinkoff_Public_Invest_Api_Contract_V1_OrdersStreamServiceAsyncClientProtocol {}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension OrdersStreamServiceClient: OrdersStreamServiceAsyncClient {}
#endif
