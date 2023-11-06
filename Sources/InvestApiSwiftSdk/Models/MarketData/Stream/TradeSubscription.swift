/// Статус подписки на поток обезличенных сделок.
public struct TradeSubscription: Codable {
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Uid идентификатор инструмента.
    public let uid: String
    
    /// Статус подписки.
    public let status: MarketDataStreamSubscriptionStatus
}

internal extension TradeSubscription {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_TradeSubscription) {
        self.init(
            figi: grpcModel.figi,
            uid: grpcModel.instrumentUid,
            status: MarketDataStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradeSubscription {
    func toModel() -> TradeSubscription {
        TradeSubscription(grpcModel: self)
    }
}