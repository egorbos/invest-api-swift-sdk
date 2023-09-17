import NIOCore
import Foundation

/// Сервис получения информации о портфеле в реальном времени
public protocol OperationsStreamService {

}

internal struct GrpcOperationsStreamService: OperationsStreamService {
    let client: OperationsStreamServiceClient
    
    init(_ client: OperationsStreamServiceClient) {
        self.client = client
    }
}
