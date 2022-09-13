public class CommonApiRequest<Result>: ApiRequest<CommonApiClient, Result> {
    /// Экземпляр `CommonApiRequest` для получения счетов пользователя.
    public static var getAccounts: CommonApiRequest<[Account]> {
        .init { client in
            return try client.user.getAccounts()
        }
    }
    
    /// Возвращает экземпляр `CommonApiRequest` для получения маржинальных показателей по счёту пользователя.
    ///
    ///  - parameters:
    ///      - accountId: Идентификатор счёта пользователя.
    public static func getMarginAttributes(accountId id: String) -> CommonApiRequest<MarginAttributes> {
        .init { client in
            return try client.user.getMarginAttributes(accountId: id)
        }
    }
    
    /// Экземпляр `CommonApiRequest` для получения лимитов запросов пользователя.
    public static var getUserTariff: CommonApiRequest<UserTariff> {
        .init { client in
            return try client.user.getUserTariff()
        }
    }
    
    /// Экземпляр `CommonApiRequest` для получения информации о статусе пользователя.
    public static var getInfo: CommonApiRequest<UserInfo> {
        .init { client in
            return try client.user.getInfo()
        }
    }
}
