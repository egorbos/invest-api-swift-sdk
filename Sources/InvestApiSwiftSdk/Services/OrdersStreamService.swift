import Foundation

protocol OrdersStreamService {
    
}

final internal class GrpcOrdersStreamService: GrpcService, OrdersStreamService {
    private lazy var client = OrdersStreamServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
