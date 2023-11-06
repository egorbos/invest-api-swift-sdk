/// Результат подписки.
public struct OrderBooksSubscriptionResult: Codable {
    /// Уникальный идентификатор запроса.
    public let trackingId: String
    
    /// Статусы подписок на стаканы.
    public let subscriptions: [OrderBookSubscription]
}

internal extension OrderBooksSubscriptionResult {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.orderBookSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookResponse {
    func toModel() -> OrderBooksSubscriptionResult {
        OrderBooksSubscriptionResult(grpcModel: self)
    }
}
