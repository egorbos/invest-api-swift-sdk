/// Лимит unary-методов.
public struct UnaryLimit: Codable {
    /// Количество unary-запросов в минуту.
    public let limitPerMinute: Int32
    
    /// Названия методов.
    public let methods: [String]
}

internal extension UnaryLimit {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_UnaryLimit) {
        self.limitPerMinute = grpcModel.limitPerMinute
        self.methods = grpcModel.methods
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_UnaryLimit {
    func toModel() -> UnaryLimit {
        UnaryLimit(grpcModel: self)
    }
}
