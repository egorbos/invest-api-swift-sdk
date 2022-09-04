import Foundation

protocol SandboxService {
    
}

final internal class GrpcSandboxService: GrpcService, SandboxService {
    private lazy var client = SandboxServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
