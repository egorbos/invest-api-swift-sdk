/// Статус подписки на стакан.
public struct OrderBookSubscription: Codable {
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Uid идентификатор инструмента.
    public let uid: String
    
    /// Глубина стакана.
    public let depth: Int32
    
    /// Статус подписки.
    public let status: MarketDataStreamSubscriptionStatus
}

internal extension OrderBookSubscription {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderBookSubscription) {
        self.init(
            figi: grpcModel.figi,
            uid: grpcModel.instrumentUid,
            depth: grpcModel.depth,
            status: MarketDataStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderBookSubscription {
    func toModel() -> OrderBookSubscription {
        OrderBookSubscription(grpcModel: self)
    }
}
