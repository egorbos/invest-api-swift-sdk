import Foundation

/// Лимит unary-методов.
public struct UnaryLimit: Codable {
    /// Количество unary-запросов в минуту.
    let limitPerMinute: Int32
    
    /// Названия методов.
    let methods: [String]
}

internal extension UnaryLimit {
    init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_UnaryLimit) {
        self.limitPerMinute = grpcModel.limitPerMinute
        self.methods = grpcModel.methods
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_UnaryLimit {
    func toModel() -> UnaryLimit {
        UnaryLimit(grpcModel: self)
    }
}
