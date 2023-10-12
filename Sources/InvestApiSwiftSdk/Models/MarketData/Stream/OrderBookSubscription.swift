/// Статус подписки на стакан.
public struct OrderBookSubscription: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Uid идентификатор инструмента.
    let uid: String
    
    /// Глубина стакана.
    let depth: Int32
    
    /// Статус подписки.
    let status: MarketDataStreamSubscriptionStatus
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
