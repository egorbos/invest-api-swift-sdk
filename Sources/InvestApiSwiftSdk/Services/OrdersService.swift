import Foundation

public protocol OrdersService {
    
}

internal struct GrpcOrdersService: OrdersService {
    let client: OrdersServiceClient
    
    init(_ client: OrdersServiceClient) {
        self.client = client
    }
}
