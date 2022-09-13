import Foundation

public protocol SandboxOperationsService {
    
}

public protocol CommonOperationsService: SandboxOperationsService {
    
}

internal struct GrpcOperationsService: CommonOperationsService {
    let client: OperationsServiceAsyncClient
    
    init(_ client: OperationsServiceAsyncClient) {
        self.client = client
    }
}
