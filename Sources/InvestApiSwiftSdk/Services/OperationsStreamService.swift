import Foundation

public protocol OperationsStreamService {
    
}

internal struct GrpcOperationsStreamService: OperationsStreamService {
    let client: OperationsStreamServiceClient
    
    init(_ client: OperationsStreamServiceClient) {
        self.client = client
    }
}
