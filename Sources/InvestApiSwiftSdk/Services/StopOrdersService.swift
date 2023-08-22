import Foundation

public protocol StopOrdersService {
    
}

internal struct GrpcStopOrdersService: StopOrdersService {
    let client: StopOrdersServiceClient
    
    init(_ client: StopOrdersServiceClient) {
        self.client = client
    }
}
