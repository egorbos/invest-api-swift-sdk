import Foundation

protocol StopOrdersService {
    
}

final internal class GrpcStopOrdersService: GrpcService, StopOrdersService {
    private lazy var client = StopOrdersServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
