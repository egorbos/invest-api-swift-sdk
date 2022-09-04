import GRPC
import NIOCore
import Foundation

internal class GrpcService {
    let group: EventLoopGroup
    let callOptions: CallOptions
    let channel: ClientConnection

    init(_ configBuilder: ConnectionConfigurationBuilder) {
        self.group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        let configuration = configBuilder.build(group: self.group)
        self.callOptions = configuration.callOptions
        self.channel = ClientConnection(configuration: configuration.connectionConfiguration)
    }
}
