import GRPC

public protocol StopOrdersServiceClientInterceptorFactory:
    Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol {}

internal struct StopOrdersServiceInterceptorFactory: StopOrdersServiceClientInterceptorFactory {
    func makePostStopOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>] {
        return []
    }

    func makeGetStopOrdersInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>] {
        return []
    }

    func makeCancelStopOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>] {
        return []
    }
}
