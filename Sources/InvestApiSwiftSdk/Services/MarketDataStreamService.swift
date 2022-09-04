import Foundation

protocol MarketDataStreamService {
    
}

final internal class GrpcMarketDataStreamService: GrpcService, MarketDataStreamService {
    private lazy var client = MarketDataStreamServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
