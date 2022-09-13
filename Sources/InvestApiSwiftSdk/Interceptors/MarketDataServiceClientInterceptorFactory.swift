import GRPC
import Foundation

public protocol MarketDataServiceClientInterceptorFactory:
    Tinkoff_Public_Invest_Api_Contract_V1_MarketDataServiceClientInterceptorFactoryProtocol {}

internal struct MarketDataServiceInterceptorFactory: MarketDataServiceClientInterceptorFactory {
    func makeGetCandlesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetCandlesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetCandlesResponse>] {
        return []
    }

    func makeGetLastPricesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetLastPricesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetLastPricesResponse>] {
        return []
    }

    func makeGetOrderBookInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetOrderBookRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetOrderBookResponse>] {
        return []
    }

    func makeGetTradingStatusInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusResponse>] {
        return []
    }

    func makeGetLastTradesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetLastTradesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetLastTradesResponse>] {
        return []
    }

    func makeGetClosePricesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetClosePricesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetClosePricesResponse>] {
        return []
    }
}
