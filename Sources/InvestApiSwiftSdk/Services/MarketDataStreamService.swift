import NIOCore
import Foundation

/// Сервис получения биржевой информации в реальном времени.
public protocol MarketDataStreamService {
   
}

internal struct GrpcMarketDataStreamService: MarketDataStreamService {
    let client: MarketDataStreamServiceClient
    
    init(_ client: MarketDataStreamServiceClient) {
        self.client = client
    }
}
