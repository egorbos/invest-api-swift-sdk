/// Текущие лимиты пользователя.
public struct UserTariff: Codable {
    /// Лимиты пользователя по unary-запросам.
    public let unaryLimits: [UnaryLimit]
    
    /// Лимиты пользователя для stream-соединений.
    public let streamLimits: [StreamLimit]
}

internal extension UserTariff {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse) {
        self.unaryLimits = grpcModel.unaryLimits.map { $0.toModel() }
        self.streamLimits = grpcModel.streamLimits.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse {
    func toModel() -> UserTariff {
        UserTariff(grpcModel: self)
    }
}
