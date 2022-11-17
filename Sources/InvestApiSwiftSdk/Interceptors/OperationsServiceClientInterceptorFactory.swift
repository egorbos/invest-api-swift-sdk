import GRPC

public protocol OperationsServiceClientInterceptorFactory:
    Tinkoff_Public_Invest_Api_Contract_V1_OperationsServiceClientInterceptorFactoryProtocol {}

internal struct OperationsServiceInterceptorFactory: OperationsServiceClientInterceptorFactory {
    func makeGetOperationsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_OperationsRequest, Tinkoff_Public_Invest_Api_Contract_V1_OperationsResponse>] {
        return []
    }

    func makeGetPortfolioInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioRequest, Tinkoff_Public_Invest_Api_Contract_V1_PortfolioResponse>] {
        return []
    }

    func makeGetPositionsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PositionsRequest, Tinkoff_Public_Invest_Api_Contract_V1_PositionsResponse>] {
        return []
    }

    func makeGetWithdrawLimitsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest, Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse>] {
        return []
    }

    func makeGetBrokerReportInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_BrokerReportRequest, Tinkoff_Public_Invest_Api_Contract_V1_BrokerReportResponse>] {
        return []
    }

    func makeGetDividendsForeignIssuerInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerResponse>] {
        return []
    }

    func makeGetOperationsByCursorInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorResponse>] {
        return []
    }
}
