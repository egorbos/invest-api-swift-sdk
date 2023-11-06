import NIOCore

/// Сервис предоставления справочной информации о пользователе.
public protocol SandboxUsersService {
    /// Получает счета пользователя.
    ///
    ///  - Returns: Массив счетов пользователя `[Account]`.
    func getAccounts() throws -> EventLoopFuture<[Account]>
    
    /// Получает текущие лимиты запросов пользователя.
    ///
    ///  - Returns: Лимиты запросов пользователя `UserTariff`.
    func getUserTariff() throws -> EventLoopFuture<UserTariff>
    
    /// Получает информацию о статусе пользователя.
    ///
    ///  - Returns: Информация о статусе  пользователя `UserInfo`.
    func getInfo() throws -> EventLoopFuture<UserInfo>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Получает счета пользователя.
    ///
    ///  - Returns: Массив счетов пользователя `[Account]`.
    func getAccounts() async throws -> [Account]

    /// Получает текущие лимиты запросов пользователя.
    ///
    ///  - Returns: Лимиты запросов пользователя `UserTariff`.
    func getUserTariff() async throws -> UserTariff

    /// Получает информацию о статусе пользователя.
    ///
    ///  - Returns: Информация о статусе  пользователя `UserInfo`
    func getInfo() async throws -> UserInfo
#endif
}

/// Сервис предоставления справочной информации о пользователе.
public protocol CommonUsersService: SandboxUsersService {
    /// Получает маржинальные показатели по счёту пользователя.
    ///
    ///  - Parameter accountId: Идентификатор счёта пользователя.
    ///
    ///  - Returns: Информация о статусе  пользователя `UserInfo`.
    func getMarginAttributes(accountId id: String) throws -> EventLoopFuture<MarginAttributes>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Получает маржинальные показатели по счёту пользователя.
    ///
    ///  - Parameter accountId: Идентификатор счёта пользователя.
    ///
    ///  - Returns: Информация о статусе  пользователя `UserInfo`.
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
            .getAccounts(.new())
            .response
            .flatMapThrowing {
                try $0.accounts.map { account in try account.toModel() }
            }
    }
       
    func getUserTariff() throws -> EventLoopFuture<UserTariff> {
        self.client
            .getUserTariff(.new())
            .response
            .map { $0.toModel() }
    }
    
    func getInfo() throws -> EventLoopFuture<UserInfo> {
        self.client
            .getInfo(.new())
            .response
            .map { $0.toModel() }
    }
    
    func getMarginAttributes(accountId id: String) throws -> EventLoopFuture<MarginAttributes> {
        self.client
            .getMarginAttributes(.new(accountId: id))
            .response
            .map { $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func getAccounts() async throws -> [Account] {
        try await self.client
            .getAccounts(.new())
            .accounts
            .map { try $0.toModel() }
    }

    func getUserTariff() async throws -> UserTariff {
        try await self.client
            .getUserTariff(.new())
            .toModel()
    }

    func getInfo() async throws -> UserInfo {
        try await self.client
            .getInfo(.new())
            .toModel()
    }

    func getMarginAttributes(accountId id: String) async throws -> MarginAttributes {
        try await self.client
            .getMarginAttributes(.new(accountId: id))
            .toModel()
    }
#endif
}
