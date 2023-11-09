/// Статус подписки на стакан.
public protocol OrderBookSubscription {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Uid идентификатор инструмента.
    var uid: String { get }
    
    /// Глубина стакана.
    var depth: Int32 { get }
    
    /// Статус подписки.
    var status: MarketDataStreamSubscriptionStatus { get }
}

internal struct OrderBookSubscriptionModel: OrderBookSubscription {
    let figi: String
    
    let uid: String
    
    let depth: Int32
    
    let status: MarketDataStreamSubscriptionStatus
}

internal extension OrderBookSubscriptionModel {
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
    func toModel() -> OrderBookSubscriptionModel {
        OrderBookSubscriptionModel(grpcModel: self)
    }
}
