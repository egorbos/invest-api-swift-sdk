import Foundation

protocol OrdersService {
    
}

final internal class GrpcOrdersService: GrpcService, OrdersService {
    private lazy var client = OrdersServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
