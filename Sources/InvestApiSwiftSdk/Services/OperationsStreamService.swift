import Foundation

public protocol OperationsStreamService {
    
}

internal struct GrpcOperationsStreamService: OperationsStreamService {
    let client: OperationsStreamServiceAsyncClient
    
    init(_ client: OperationsStreamServiceAsyncClient) {
        self.client = client
    }
}
