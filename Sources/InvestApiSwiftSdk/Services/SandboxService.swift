import Foundation

public protocol SandboxService {
    
}

internal struct GrpcSandboxService: SandboxService {
    let client: SandboxServiceAsyncClient
    
    init(_ client: SandboxServiceAsyncClient) {
        self.client = client
    }
}
