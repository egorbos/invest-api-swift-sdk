internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest {
    func with(accountId: String) -> Self {
        var request = self
        request.accountID = accountId
        return request
    }
}

internal struct Requests {
    struct UsersServiceRequests {
        static let getAccountsRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest()
        static let getMarginAttributesRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest()
        static let getUserTariffRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest()
        static let getInfoRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest()
    }
}
