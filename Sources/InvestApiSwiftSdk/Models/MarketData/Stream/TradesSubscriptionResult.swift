/// Результат подписки.
public struct TradesSubscriptionResult: Codable {
    /// Уникальный идентификатор запроса.
    public let trackingId: String
    
    /// Статусы подписок на потоки обезличенных сделок.
    public let subscriptions: [TradeSubscription]
}

internal extension TradesSubscriptionResult {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.tradeSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesResponse {
    func toModel() -> TradesSubscriptionResult {
        TradesSubscriptionResult(grpcModel: self)
    }
}
