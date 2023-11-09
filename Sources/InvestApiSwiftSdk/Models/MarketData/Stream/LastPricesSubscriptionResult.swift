/// Результат подписки.
public protocol LastPricesSubscriptionResult {
    /// Уникальный идентификатор запроса.
    var trackingId: String { get }
    
    /// Статусы подписок на цены последних сделок.
    var subscriptions: [LastPriceSubscription] { get }
}

internal struct LastPricesSubscriptionResultModel: LastPricesSubscriptionResult {
    let trackingId: String
    
    let subscriptions: [LastPriceSubscription]
}

internal extension LastPricesSubscriptionResultModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.lastPriceSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceResponse {
    func toModel() -> LastPricesSubscriptionResultModel {
        LastPricesSubscriptionResultModel(grpcModel: self)
    }
}

