import Foundation

final class InvestApiClient {
    private struct Constants {
        static let port = 443
        static let commonHost = "invest-public-api.tinkoff.ru"
        static let sandboxHost = "sandbox-invest-public-api.tinkoff.ru"
        static let appName = "codes.egorbos.invest-api-swift-sdk"
    }
    
    static func sandbox(
        _ token: String,
        appName: String = Constants.appName,
        host: String = Constants.sandboxHost,
        port: Int = Constants.port
    ) -> SandboxApiClient {
        return InvestSandboxApiClient(target: .sandbox(host, port: port), token: token, appName: appName)
    }
    
    static func common(
        _ token: String,
        appName: String = Constants.appName,
        host: String = Constants.commonHost,
        port: Int = Constants.port
    ) -> CommonApiClient {
        return InvestCommonApiClient(target: .common(host, port: port), token: token, appName: appName)
    }
}
