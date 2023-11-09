/// Статус подписки на свечи.
public protocol CandleSubscription {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Uid идентификатор инструмента.
    var uid: String { get }
    
    /// Интервал свечей.
    var interval: SubscriptionInterval { get }
    
    /// Статус подписки.
    var status: MarketDataStreamSubscriptionStatus { get }
}

internal struct CandleSubscriptionModel: CandleSubscription {
    let figi: String
    
    let uid: String
    
    let interval: SubscriptionInterval
    
    let status: MarketDataStreamSubscriptionStatus
}

internal extension CandleSubscriptionModel {
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
    func toModel() -> CandleSubscriptionModel {
        CandleSubscriptionModel(grpcModel: self)
    }
}
