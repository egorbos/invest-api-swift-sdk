/// Статус подписки на цену последней сделки.
public struct LastPriceSubscription: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Uid идентификатор инструмента.
    let uid: String
    
    /// Статус подписки.
    let status: MarketDataStreamSubscriptionStatus
}

internal extension LastPriceSubscription {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_LastPriceSubscription) {
        self.init(
            figi: grpcModel.figi,
            uid: grpcModel.instrumentUid,
            status: MarketDataStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_LastPriceSubscription {
    func toModel() -> LastPriceSubscription {
        LastPriceSubscription(grpcModel: self)
    }
}
