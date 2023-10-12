/// Статус подписки на свечи.
public struct CandleSubscription: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Uid идентификатор инструмента.
    let uid: String
    
    /// Интервал свечей.
    let interval: SubscriptionInterval
    
    /// Статус подписки.
    let status: MarketDataStreamSubscriptionStatus
}

internal extension CandleSubscription {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_CandleSubscription) {
        self.init(
            figi: grpcModel.figi,
            uid: grpcModel.instrumentUid,
            interval: SubscriptionInterval(rawValue: grpcModel.interval.rawValue) ?? .unspecified,
            status: MarketDataStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CandleSubscription {
    func toModel() -> CandleSubscription {
        CandleSubscription(grpcModel: self)
    }
}
