import GRPC

public protocol SandboxServiceClientInterceptorFactory:
    Tinkoff_Public_Invest_Api_Contract_V1_SandboxServiceClientInterceptorFactoryProtocol {}

internal struct SandboxServiceInterceptorFactory: SandboxServiceClientInterceptorFactory {
    func makeOpenSandboxAccountInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_OpenSandboxAccountRequest, Tinkoff_Public_Invest_Api_Contract_V1_OpenSandboxAccountResponse>] {
        return []
    }
    
    func makeGetSandboxAccountsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse>] {
        return []
    }
    
    func makeCloseSandboxAccountInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_CloseSandboxAccountRequest, Tinkoff_Public_Invest_Api_Contract_V1_CloseSandboxAccountResponse>] {
        return []
    }
    
    func makePostSandboxOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PostOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse>] {
        return []
    }
    
    func makeReplaceSandboxOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_ReplaceOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse>] {
        return []
    }
    
    func makeGetSandboxOrdersInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersResponse>] {
        return []
    }
    
    func makeCancelSandboxOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderResponse>] {
        return []
    }
    
    func makeGetSandboxOrderStateInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetOrderStateRequest, Tinkoff_Public_Invest_Api_Contract_V1_OrderState>] {
        return []
    }
    
    func makeGetSandboxPositionsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PositionsRequest, Tinkoff_Public_Invest_Api_Contract_V1_PositionsResponse>] {
        return []
    }
    
    func makeGetSandboxOperationsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_OperationsRequest, Tinkoff_Public_Invest_Api_Contract_V1_OperationsResponse>] {
        return []
    }
    
    func makeGetSandboxPortfolioInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioRequest, Tinkoff_Public_Invest_Api_Contract_V1_PortfolioResponse>] {
        return []
    }
    
    func makeSandboxPayInInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_SandboxPayInRequest, Tinkoff_Public_Invest_Api_Contract_V1_SandboxPayInResponse>] {
        return []
    }
    
    func makeGetSandboxWithdrawLimitsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest, Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse>] {
        return []
    }
}
