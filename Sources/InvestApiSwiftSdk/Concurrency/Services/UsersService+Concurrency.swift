#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 12, iOS 15, watchOS 8, tvOS 15, *)
public extension SandboxUsersService {
    func getAccounts() async throws -> [Account] {
        try await self.client
            .makeGetAccountsCall(Requests.UsersServiceRequests.getAccountsRequest)
            .response
            .accounts
            .map { account in try account.toModel() }
    }
    
    func getUserTariff() async throws -> UserTariff {
        try await self.client
            .makeGetUserTariffCall(Requests.UsersServiceRequests.getUserTariffRequest)
            .response
            .toModel()
    }
    
    func getInfo() async throws -> UserInfo {
        try await self.client
            .makeGetInfoCall(Requests.UsersServiceRequests.getInfoRequest)
            .response
            .toModel()
    }
}

@available(macOS 12, iOS 15, watchOS 8, tvOS 15, *)
public extension CommonUsersService {
    func getMarginAttributes(accountId id: String) async throws -> MarginAttributes {
        try await self.client
            .makeGetMarginAttributesCall(
                Requests.UsersServiceRequests.getMarginAttributesRequest.with(accountId: id)
            )
            .response
            .toModel()
    }
}
#endif
