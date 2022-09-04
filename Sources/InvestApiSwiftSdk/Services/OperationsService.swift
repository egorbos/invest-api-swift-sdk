import Foundation

protocol SandboxOperationsService {
    
}

protocol CommonOperationsService: SandboxOperationsService {
    
}

final internal class GrpcOperationsService: GrpcService, CommonOperationsService {
    private lazy var client = OperationsServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
