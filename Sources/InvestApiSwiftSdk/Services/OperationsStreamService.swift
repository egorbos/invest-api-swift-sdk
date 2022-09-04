import Foundation

protocol OperationsStreamService {
    
}

final internal class GrpcOperationsStreamService: GrpcService, OperationsStreamService {
    private lazy var client = OperationsStreamServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
