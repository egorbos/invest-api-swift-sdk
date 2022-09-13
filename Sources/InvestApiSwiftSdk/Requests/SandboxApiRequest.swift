public class SandboxApiRequest<Result>: ApiRequest<SandboxApiClient, Result> {
    /// Экземпляр `SandboxApiRequest` для получения счетов пользователя.
    public static var getAccounts: SandboxApiRequest<[Account]> {
        .init { client in
            return try client.user.getAccounts()
        }
    }
    
    /// Экземпляр `SandboxApiRequest` для получения лимитов запросов пользователя.
    public static var getUserTariff: SandboxApiRequest<UserTariff> {
        .init { client in
            return try client.user.getUserTariff()
        }
    }
    
    /// Экземпляр `SandboxApiRequest` для получения информации о статусе пользователя.
    public static var getInfo: SandboxApiRequest<UserInfo> {
        .init { client in
            return try client.user.getInfo()
        }
    }
}
