import Foundation

public protocol OrdersStreamService {
    
}

internal struct GrpcOrdersStreamService: OrdersStreamService {
    let client: OrdersStreamServiceAsyncClient
    
    init(_ client: OrdersStreamServiceAsyncClient) {
        self.client = client
    }
}
