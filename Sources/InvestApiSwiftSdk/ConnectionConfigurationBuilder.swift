import GRPC
import NIOCore
import NIOHPACK
import Foundation

internal struct ConnectionConfiguration {
    let callOptions: CallOptions
    let connectionConfiguration: ClientConnection.Configuration
}

internal protocol ConnectionConfigurationBuilder {
    func build(group: EventLoopGroup) -> ConnectionConfiguration
}

internal final class ConfigurationBuilder: ConnectionConfigurationBuilder {
    private let target: ConnectionTarget
    private let callOptions: CallOptions
    
    init(_ target: ApiTarget, token: String, appName: String) {
        let headers = HPACKHeaders([("Authorization", token), ("x-app-name", appName)])
        self.callOptions = CallOptions(customMetadata: headers)
        self.target = .hostAndPort(target.host, target.port)
    }
    
    func build(group: EventLoopGroup) -> ConnectionConfiguration {
        var configuration = ClientConnection.Configuration.default(
            target: self.target,
            eventLoopGroup: group
        )
        configuration.tlsConfiguration = .makeClientConfigurationBackedByNIOSSL()
        return ConnectionConfiguration(
            callOptions: self.callOptions,
            connectionConfiguration: configuration
        )
    }
}
