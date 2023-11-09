/// Статус подписки на цену последней сделки.
public protocol LastPriceSubscription {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Uid идентификатор инструмента.
    var uid: String { get }
    
    /// Статус подписки.
    var status: MarketDataStreamSubscriptionStatus { get }
}

internal struct LastPriceSubscriptionModel: LastPriceSubscription {
    let figi: String
    
    let uid: String
    
    let status: MarketDataStreamSubscriptionStatus
}

internal extension LastPriceSubscriptionModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_LastPriceSubscription) {
        self.init(
            figi: grpcModel.figi,
            uid: grpcModel.instrumentUid,
            status: MarketDataStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_LastPriceSubscription {
    func toModel() -> LastPriceSubscriptionModel {
        LastPriceSubscriptionModel(grpcModel: self)
    }
}
