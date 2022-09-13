import Foundation

public protocol MarketDataService {
    
}

internal struct GrpcMarketDataService: MarketDataService {
    let client: MarketDataServiceAsyncClient
    
    init(_ client: MarketDataServiceAsyncClient) {
        self.client = client
    }
}
