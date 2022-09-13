import Foundation

/// Текущие лимиты пользователя.
public struct UserTariff: Codable {
    /// Лимиты пользователя по unary-запросам.
    let unaryLimits: [UnaryLimit]
    
    /// Лимиты пользователя для stream-соединений.
    let streamLimits: [StreamLimit]
}

internal extension UserTariff {
    init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse) {
        self.unaryLimits = grpcModel.unaryLimits.map({ unaryLimit in unaryLimit.toModel() })
        self.streamLimits = grpcModel.streamLimits.map({ streamLimit in streamLimit.toModel() })
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse {
    func toModel() -> UserTariff {
        UserTariff(grpcModel: self)
    }
}
