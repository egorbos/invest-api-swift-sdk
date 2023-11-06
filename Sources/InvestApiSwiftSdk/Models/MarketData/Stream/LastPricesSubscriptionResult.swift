/// Результат подписки.
public struct LastPricesSubscriptionResult: Codable {
    /// Уникальный идентификатор запроса.
    public let trackingId: String
    
    /// Статусы подписок на цены последних сделок.
    public let subscriptions: [LastPriceSubscription]
}

internal extension LastPricesSubscriptionResult {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.lastPriceSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceResponse {
    func toModel() -> LastPricesSubscriptionResult {
        LastPricesSubscriptionResult(grpcModel: self)
    }
}

