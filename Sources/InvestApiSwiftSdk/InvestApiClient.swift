public final class InvestApiClient {
    public struct Constants {
        public static let port = 443
        public static let commonHost = "invest-public-api.tinkoff.ru"
        public static let sandboxHost = "sandbox-invest-public-api.tinkoff.ru"
        public static let appName = "codes.egorbos.invest-api-swift-sdk"
    }
    
    /// Создаёт экземпляр `SandboxApiClient` для взаимодействия с Tinkoff API (канал песочницы).
    ///
    ///  - Parameters:
    ///      - token: Токен доступа клиента к Tinkoff API.
    ///      - appName: Наименование приложения. По умолчанию: codes.egorbos.invest-api-swift-sdk
    ///      - host: Адрес назначения Tinkoff API. По умолчанию: sandbox-invest-public-api.tinkoff.ru
    ///      - port: Порт назначения Tinkoff API. По умолчанию: 443
    ///
    ///  - Returns: Экземпляр клиента `SandboxApiClient`.
    public static func sandbox(
        _ token: String,
        appName: String = Constants.appName,
        host: String = Constants.sandboxHost,
        port: Int = Constants.port
    ) throws -> SandboxApiClient {
        guard !token.isEmpty, !host.isEmpty, port != 0 else {
            throw InvestApiError.invalidInitializationData
        }
        return try SandboxInvestApiClient(
            .sandbox(host, port: port),
            token: token,
            appName: appName.isEmpty ? Constants.appName : appName
        )
    }
    
    /// Создаёт экземпляр `CommonApiClient` для взаимодействия с Tinkoff API (основной канал).
    ///
    ///  - Parameters:
    ///      - token: Токен доступа клиента к Tinkoff API.
    ///      - appName: Наименование приложения. По умолчанию: codes.egorbos.invest-api-swift-sdk
    ///      - host: Адрес назначения Tinkoff API. По умолчанию: invest-public-api.tinkoff.ru
    ///      - port: Порт назначения Tinkoff API. По умолчанию: 443
    ///
    ///  - Returns: Экземпляр клиента `CommonApiClient`.
    public static func common(
        _ token: String,
        appName: String = Constants.appName,
        host: String = Constants.commonHost,
        port: Int = Constants.port
    ) throws -> CommonApiClient {
        guard !token.isEmpty, !host.isEmpty, port != 0 else {
            throw InvestApiError.invalidInitializationData
        }
        return try CommonInvestApiClient(
            .common(host, port: port),
            token: token,
            appName: appName.isEmpty ? Constants.appName : appName
        )
    }
}
