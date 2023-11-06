import GRPC
import NIOCore

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
        ) { config in
            // Максимальный объём данных в сообщении, принимаемом от сервера
            config.maximumReceiveMessageLength = 8 * 1000000 // 8 МБ
        }
    }
    
    func close() {
        _ = self.channel.close()
        try? self.group.syncShutdownGracefully()
    }
}
