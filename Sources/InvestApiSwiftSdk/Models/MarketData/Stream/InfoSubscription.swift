/// Статус подписки на торговый статус.
public struct InfoSubscription: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Uid идентификатор инструмента.
    let uid: String
    
    /// Статус подписки.
    let status: MarketDataStreamSubscriptionStatus
}

internal extension InfoSubscription {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_InfoSubscription) {
        self.init(
            figi: grpcModel.figi,
            uid: grpcModel.instrumentUid,
            status: MarketDataStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InfoSubscription {
    func toModel() -> InfoSubscription {
        InfoSubscription(grpcModel: self)
    }
}

