/// Статус подписки на торговый статус.
public protocol InfoSubscription {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Uid идентификатор инструмента.
    var uid: String { get }
    
    /// Статус подписки.
    var status: MarketDataStreamSubscriptionStatus { get }
}

internal struct InfoSubscriptionModel: InfoSubscription {
    let figi: String
    
    let uid: String
    
    let status: MarketDataStreamSubscriptionStatus
}

internal extension InfoSubscriptionModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_InfoSubscription) {
        self.init(
            figi: grpcModel.figi,
            uid: grpcModel.instrumentUid,
            status: MarketDataStreamSubscriptionStatus(rawValue: grpcModel.subscriptionStatus.rawValue) ?? .unspecified
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InfoSubscription {
    func toModel() -> InfoSubscriptionModel {
        InfoSubscriptionModel(grpcModel: self)
    }
}

