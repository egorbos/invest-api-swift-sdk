/// Лимит unary-методов.
public protocol UnaryLimit {
    /// Количество unary-запросов в минуту.
    var limitPerMinute: Int32 { get }
    
    /// Названия методов.
    var methods: [String] { get }
}

internal struct UnaryLimitModel: UnaryLimit {
    let limitPerMinute: Int32
    
    let methods: [String]
}

internal extension UnaryLimitModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_UnaryLimit) {
        self.limitPerMinute = grpcModel.limitPerMinute
        self.methods = grpcModel.methods
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_UnaryLimit {
    func toModel() -> UnaryLimitModel {
        UnaryLimitModel(grpcModel: self)
    }
}
