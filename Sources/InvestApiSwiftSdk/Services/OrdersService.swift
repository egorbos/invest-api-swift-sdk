import Foundation

public protocol OrdersService {
    
}

internal struct GrpcOrdersService: OrdersService {
    let client: OrdersServiceAsyncClient
    
    init(_ client: OrdersServiceAsyncClient) {
        self.client = client
    }
}
