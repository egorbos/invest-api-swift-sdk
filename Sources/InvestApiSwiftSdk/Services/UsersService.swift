import NIOCore

/// Сервис предоставления справочной информации о пользователе.
public protocol SandboxUsersService {
    /// Получает счета пользователя.
    ///
    ///  - returns: Массив счетов пользователя `[Account]`.
    func getAccounts() throws -> EventLoopFuture<[Account]>
    
    /// Получает текущие лимиты запросов пользователя.
    ///
    ///  - returns: Лимиты запросов пользователя `UserTariff`.
    func getUserTariff() throws -> EventLoopFuture<UserTariff>
    
    /// Получает информацию о статусе пользователя.
    ///
    ///  - returns: Информация о статусе  пользователя `UserInfo`.
    func getInfo() throws -> EventLoopFuture<UserInfo>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Получает счета пользователя.
    ///
    ///  - returns: Массив счетов пользователя `[Account]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getAccounts() async throws -> [Account]

    /// Получает текущие лимиты запросов пользователя.
    ///
    ///  - returns: Лимиты запросов пользователя `UserTariff`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getUserTariff() async throws -> UserTariff

    /// Получает информацию о статусе пользователя.
    ///
    ///  - returns: Информация о статусе  пользователя `UserInfo`
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getInfo() async throws -> UserInfo
#endif
}

public protocol CommonUsersService: SandboxUsersService {
    /// Получает маржинальные показатели по счёту пользователя.
    ///
    ///  - parameters:
    ///      - accountId: Идентификатор счёта пользователя.
    ///
    ///  - returns: Информация о статусе  пользователя `UserInfo`.
    func getMarginAttributes(accountId id: String) throws -> EventLoopFuture<MarginAttributes>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Получает маржинальные показатели по счёту пользователя.
    ///
    ///  - parameters:
    ///      - accountId: Идентификатор счёта пользователя.
    ///
    ///  - returns: Информация о статусе  пользователя `UserInfo`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getMarginAttributes(accountId id: String) async throws -> MarginAttributes
#endif
}

internal struct GrpcUsersService: CommonUsersService {
    let client: UsersServiceClient
    
    init(_ client: UsersServiceClient) {
        self.client = client
    }
    
    func getAccounts() throws -> EventLoopFuture<[Account]> {
        self.client
            .getAccounts(Requests.UsersServiceRequests.getAccountsRequest)
            .response
            .flatMapThrowing {
                try $0.accounts.map { account in try account.toModel() }
            }
    }
       
    func getUserTariff() throws -> EventLoopFuture<UserTariff> {
        self.client
            .getUserTariff(Requests.UsersServiceRequests.getUserTariffRequest)
            .response
            .map { $0.toModel() }
    }
    
    func getInfo() throws -> EventLoopFuture<UserInfo> {
        self.client
            .getInfo(Requests.UsersServiceRequests.getInfoRequest)
            .response
            .map { $0.toModel() }
    }
    
    func getMarginAttributes(accountId id: String) throws -> EventLoopFuture<MarginAttributes> {
        self.client
            .getMarginAttributes(
                Requests.UsersServiceRequests.getMarginAttributesRequest.with(accountId: id)
            )
            .response
            .map { $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func getAccounts() async throws -> [Account] {
        try await self.client
            .getAccounts(Requests.UsersServiceRequests.getAccountsRequest)
            .accounts
            .map { try $0.toModel() }
    }

    func getUserTariff() async throws -> UserTariff {
        try await self.client
            .getUserTariff(Requests.UsersServiceRequests.getUserTariffRequest)
            .toModel()
    }

    func getInfo() async throws -> UserInfo {
        try await self.client
            .getInfo(Requests.UsersServiceRequests.getInfoRequest)
            .toModel()
    }

    func getMarginAttributes(accountId id: String) async throws -> MarginAttributes {
        try await self.client
            .getMarginAttributes(
                Requests.UsersServiceRequests.getMarginAttributesRequest.with(accountId: id)
            )
            .toModel()
    }
#endif
}
