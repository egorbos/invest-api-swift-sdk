/// Лимит stream-соединений.
public protocol StreamLimit {
    /// Максимальное количество stream-соединений.
    var limit: Int32 { get }
    
    /// Названия stream-методов.
    var streams: [String] { get }
}

internal struct StreamLimitModel: StreamLimit {
    let limit: Int32
    
    let streams: [String]
}

internal extension StreamLimitModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_StreamLimit) {
        self.limit = grpcModel.limit
        self.streams = grpcModel.streams
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_StreamLimit {
    func toModel() -> StreamLimitModel {
        StreamLimitModel(grpcModel: self)
    }
}
