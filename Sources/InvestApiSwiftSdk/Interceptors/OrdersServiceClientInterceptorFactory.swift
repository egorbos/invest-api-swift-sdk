import GRPC
import Foundation

public protocol OrdersServiceClientInterceptorFactory:
    Tinkoff_Public_Invest_Api_Contract_V1_OrdersServiceClientInterceptorFactoryProtocol {}

internal struct OrdersServiceInterceptorFactory: OrdersServiceClientInterceptorFactory {
    func makePostOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PostOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse>] {
        return []
    }

    func makeCancelOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderResponse>] {
        return []
    }

    func makeGetOrderStateInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetOrderStateRequest, Tinkoff_Public_Invest_Api_Contract_V1_OrderState>] {
        return []
    }

    func makeGetOrdersInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersResponse>] {
        return []
    }

    func makeReplaceOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_ReplaceOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse>] {
        return []
    }
}
