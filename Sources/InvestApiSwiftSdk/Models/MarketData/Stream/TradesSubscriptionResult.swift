/// Результат подписки.
public protocol TradesSubscriptionResult {
    /// Уникальный идентификатор запроса.
    var trackingId: String { get }
    
    /// Статусы подписок на потоки обезличенных сделок.
    var subscriptions: [TradeSubscription] { get }
}

internal struct TradesSubscriptionResultModel: TradesSubscriptionResult {
    let trackingId: String
    
    let subscriptions: [TradeSubscription]
}

internal extension TradesSubscriptionResultModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.tradeSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesResponse {
    func toModel() -> TradesSubscriptionResultModel {
        TradesSubscriptionResultModel(grpcModel: self)
    }
}
