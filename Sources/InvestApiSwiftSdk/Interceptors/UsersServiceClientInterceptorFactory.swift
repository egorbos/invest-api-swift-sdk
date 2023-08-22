import GRPC

internal struct UsersServiceClientInterceptorFactory: Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceClientInterceptorFactoryProtocol {
    func makeGetAccountsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse>] {
        return []
    }

    func makeGetMarginAttributesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse>] {
        return []
    }

    func makeGetUserTariffInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse>] {
        return []
    }

    func makeGetInfoInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse>] {
        return []
    }
}
