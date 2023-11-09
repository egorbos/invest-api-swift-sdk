/// Результат подписки.
public protocol CandlesSubscriptionResult {
    /// Уникальный идентификатор запроса.
    var trackingId: String { get }
    
    /// Статусы подписок на свечи.
    var subscriptions: [CandleSubscription] { get }
}

internal struct CandlesSubscriptionResultModel: CandlesSubscriptionResult {
    let trackingId: String
    
    let subscriptions: [CandleSubscription]
}

internal extension CandlesSubscriptionResultModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.candlesSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesResponse {
    func toModel() -> CandlesSubscriptionResultModel {
        CandlesSubscriptionResultModel(grpcModel: self)
    }
}
