/// Результат подписки.
public protocol OrderBooksSubscriptionResult {
    /// Уникальный идентификатор запроса.
    var trackingId: String { get }
    
    /// Статусы подписок на стаканы.
    var subscriptions: [OrderBookSubscription] { get }
}

internal struct OrderBooksSubscriptionResultModel: OrderBooksSubscriptionResult {
    let trackingId: String
    
    let subscriptions: [OrderBookSubscription]
}

internal extension OrderBooksSubscriptionResultModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.orderBookSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookResponse {
    func toModel() -> OrderBooksSubscriptionResultModel {
        OrderBooksSubscriptionResultModel(grpcModel: self)
    }
}
