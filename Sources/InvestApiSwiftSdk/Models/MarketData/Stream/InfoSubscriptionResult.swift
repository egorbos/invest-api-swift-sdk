/// Результат подписки.
public struct InfoSubscriptionResult: Codable {
    /// Уникальный идентификатор запроса.
    public let trackingId: String
    
    /// Статусы подписок на потоки торговых статусов.
    public let subscriptions: [InfoSubscription]
}

internal extension InfoSubscriptionResult {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.infoSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoResponse {
    func toModel() -> InfoSubscriptionResult {
        InfoSubscriptionResult(grpcModel: self)
    }
}


