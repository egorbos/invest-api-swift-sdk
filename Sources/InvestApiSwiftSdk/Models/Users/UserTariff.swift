/// Текущие лимиты пользователя.
public protocol UserTariff {
    /// Лимиты пользователя по unary-запросам.
    var unaryLimits: [UnaryLimit] { get }
    
    /// Лимиты пользователя для stream-соединений.
    var streamLimits: [StreamLimit] { get }
}

internal struct UserTariffModel: UserTariff {
    let unaryLimits: [UnaryLimit]
    
    let streamLimits: [StreamLimit]
}

internal extension UserTariffModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse) {
        self.unaryLimits = grpcModel.unaryLimits.map { $0.toModel() }
        self.streamLimits = grpcModel.streamLimits.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse {
    func toModel() -> UserTariffModel {
        UserTariffModel(grpcModel: self)
    }
}
