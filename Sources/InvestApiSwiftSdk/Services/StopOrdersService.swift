import Foundation

public protocol StopOrdersService {
    
}

internal struct GrpcStopOrdersService: StopOrdersService {
    let client: StopOrdersServiceAsyncClient
    
    init(_ client: StopOrdersServiceAsyncClient) {
        self.client = client
    }
}
