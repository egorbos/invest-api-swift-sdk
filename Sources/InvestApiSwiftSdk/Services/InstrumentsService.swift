import Foundation

public protocol InstrumentsService {
    
}

internal struct GrpcInstrumentsService: InstrumentsService {
    let client: InstrumentsServiceAsyncClient
    
    init(_ client: InstrumentsServiceAsyncClient) {
        self.client = client
    }
}
