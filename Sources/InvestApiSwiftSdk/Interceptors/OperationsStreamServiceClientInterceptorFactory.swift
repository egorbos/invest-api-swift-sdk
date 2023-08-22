import GRPC

internal struct OperationsStreamServiceClientInterceptorFactory: Tinkoff_Public_Invest_Api_Contract_V1_OperationsStreamServiceClientInterceptorFactoryProtocol {
    func makePortfolioStreamInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse>] {
        return []
    }

    func makePositionsStreamInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse>] {
        return []
    }
}
