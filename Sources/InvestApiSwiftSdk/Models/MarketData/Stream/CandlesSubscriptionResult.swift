/// Результат подписки.
public struct CandlesSubscriptionResult: Codable {
    /// Уникальный идентификатор запроса.
    let trackingId: String
    
    /// Статусы подписок на свечи.
    let subscriptions: [CandleSubscription]
}

internal extension CandlesSubscriptionResult {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.candlesSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesResponse {
    func toModel() -> CandlesSubscriptionResult {
        CandlesSubscriptionResult(grpcModel: self)
    }
}
