import Foundation

public protocol InstrumentsService {
    
}

internal struct GrpcInstrumentsService: InstrumentsService {
    let client: InstrumentsServiceClient
    
    init(_ client: InstrumentsServiceClient) {
        self.client = client
    }
}
