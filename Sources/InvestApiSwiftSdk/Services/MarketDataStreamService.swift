import Foundation

public protocol MarketDataStreamService {
    
}

internal struct GrpcMarketDataStreamService: MarketDataStreamService {
    let client: MarketDataStreamServiceAsyncClient
    
    init(_ client: MarketDataStreamServiceAsyncClient) {
        self.client = client
    }
}
