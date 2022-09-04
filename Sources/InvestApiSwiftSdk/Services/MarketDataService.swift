import Foundation

protocol MarketDataService {
    
}

final internal class GrpcMarketDataService: GrpcService, MarketDataService {
    private lazy var client = MarketDataServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
