internal struct Requests {
    struct UsersServiceRequests {
        static let getAccountsRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest()
        static let getMarginAttributesRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest()
        static let getUserTariffRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest()
        static let getInfoRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest()
    }
    
    struct SandboxServiceRequests {
        static let openSandboxAccountRequest = Tinkoff_Public_Invest_Api_Contract_V1_OpenSandboxAccountRequest()
        static let closeSandboxAccountRequest = Tinkoff_Public_Invest_Api_Contract_V1_CloseSandboxAccountRequest()
        static let sandboxPayInRequest = Tinkoff_Public_Invest_Api_Contract_V1_SandboxPayInRequest()
        static let withdrawLimitsRequest = Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest {
    func with(accountId: String) -> Self {
        var request = self
        request.accountID = accountId
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CloseSandboxAccountRequest {
    func with(accountId: String) -> Self {
        var request = self
        request.accountID = accountId
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SandboxPayInRequest {
    func with(accountId: String, amount: MoneyValue) throws -> Self {
        var request = self
        request.accountID = accountId
        request.amount = try amount.forRequest()
        return request
    }
}



internal extension Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest {
    func with(accountId: String) -> Self {
        var request = self
        request.accountID = accountId
        return request
    }
}
