/// Статус подписки на поток обезличенных сделок.
public protocol TradeSubscription {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Uid идентификатор инструмента.
    var uid: String { get }
    
    /// Статус подписки.
    var status: MarketDataStreamSubscriptionStatus { get }
}

internal struct TradeSubscriptionModel: TradeSubscription {
    let figi: String
    
    let uid: String
    
    let status: MarketDataStreamSubscriptionStatus
}

internal extension TradeSubscriptionModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_TradeSubscription) {
        self.init(
            figi: grpcModel.figi,
            uid: grpcModel.instrumentUid,
            status: MarketDataStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradeSubscription {
    func toModel() -> TradeSubscriptionModel {
        TradeSubscriptionModel(grpcModel: self)
    }
}
