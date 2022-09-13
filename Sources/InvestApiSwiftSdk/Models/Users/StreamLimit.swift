import Foundation

/// Лимит stream-соединений.
public struct StreamLimit: Codable {
    /// Максимальное количество stream-соединений.
    let limit: Int32
    
    /// Названия stream-методов.
    let streams: [String]
}

internal extension StreamLimit {
    init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_StreamLimit) {
        self.limit = grpcModel.limit
        self.streams = grpcModel.streams
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_StreamLimit {
    func toModel() -> StreamLimit {
        StreamLimit(grpcModel: self)
    }
}
