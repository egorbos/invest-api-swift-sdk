import GRPC

public protocol OrdersStreamServiceClientInterceptorFactory:
    Tinkoff_Public_Invest_Api_Contract_V1_OrdersStreamServiceClientInterceptorFactoryProtocol {}

internal struct OrdersStreamServiceInterceptorFactory: OrdersStreamServiceClientInterceptorFactory {
    func makeTradesStreamInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse>] {
        return []
    }
}
