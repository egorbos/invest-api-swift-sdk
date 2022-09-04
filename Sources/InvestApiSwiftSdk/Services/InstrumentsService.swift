import Foundation

protocol InstrumentsService {
    
}

final internal class GrpcInstrumentsService: GrpcService, InstrumentsService {
    private lazy var client = InstrumentsServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
