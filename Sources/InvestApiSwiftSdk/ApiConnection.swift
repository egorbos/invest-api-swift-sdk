import GRPC
import NIOCore
import Foundation

internal struct ApiConnection {
    let target: ApiTarget
    let group: EventLoopGroup
    let channel: GRPCChannel
    
    init(target: ApiTarget) throws {
        self.target = target
        self.group = PlatformSupport.makeEventLoopGroup(loopCount: System.coreCount)
        self.channel = try GRPCChannelPool.with(
            target: .host(target.host, port: target.port),
            transportSecurity: .tls(.makeClientConfigurationBackedByNIOSSL()),
            eventLoopGroup: self.group
        )
    }
    
    func close() {
        _ = self.channel.close()
        try? self.group.syncShutdownGracefully()
    }
}
