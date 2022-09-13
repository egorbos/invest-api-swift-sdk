import NIOCore
import Foundation

/// Сервис предоставления справочной информации о пользователе.
public protocol SandboxUsersService {
    /// Клиент для отправки запросов к Tinkoff API.
    var client: UsersServiceAsyncClient { get }
    
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
}

public protocol CommonUsersService: SandboxUsersService {
    /// Получает маржинальные показатели по счёту пользователя.
    ///
    ///  - parameters:
    ///      - accountId: Идентификатор счёта пользователя.
    ///
    ///  - returns: Информация о статусе  пользователя `UserInfo`.
    func getMarginAttributes(accountId id: String) throws -> EventLoopFuture<MarginAttributes>
}

internal struct GrpcUsersService: CommonUsersService {
    let client: UsersServiceAsyncClient
    
    init(_ client: UsersServiceAsyncClient) {
        self.client = client
    }
    
    func getAccounts() throws -> EventLoopFuture<[Account]> {
        self.client
            .getAccounts(Requests.UsersServiceRequests.getAccountsRequest)
            .response
            .flatMapThrowing { response in
                try response.accounts.map { account in try account.toModel() }
            }
    }
    
    func getMarginAttributes(accountId id: String) throws -> EventLoopFuture<MarginAttributes> {
        self.client
            .getMarginAttributes(
                Requests.UsersServiceRequests.getMarginAttributesRequest.with(accountId: id)
            )
            .response
            .map { response in
                response.toModel()
            }
    }
    
    func getUserTariff() throws -> EventLoopFuture<UserTariff> {
        self.client
            .getUserTariff(Requests.UsersServiceRequests.getUserTariffRequest)
            .response
            .map { response in
                response.toModel()
            }
    }
    
    func getInfo() throws -> EventLoopFuture<UserInfo> {
        self.client
            .getInfo(Requests.UsersServiceRequests.getInfoRequest)
            .response
            .map { response in
                response.toModel()
            }
    }
}
