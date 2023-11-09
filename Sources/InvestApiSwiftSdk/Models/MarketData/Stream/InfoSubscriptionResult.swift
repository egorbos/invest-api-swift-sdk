/// Результат подписки.
public protocol InfoSubscriptionResult {
    /// Уникальный идентификатор запроса.
    var trackingId: String { get }
    
    /// Статусы подписок на потоки торговых статусов.
    var subscriptions: [InfoSubscription] { get }
}

internal struct InfoSubscriptionResultModel: InfoSubscriptionResult {
    let trackingId: String
    
    let subscriptions: [InfoSubscription]
}

internal extension InfoSubscriptionResultModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoResponse) {
        self.init(
            trackingId: grpcModel.trackingID,
            subscriptions: grpcModel.infoSubscriptions.map { $0.toModel() }
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoResponse {
    func toModel() -> InfoSubscriptionResultModel {
        InfoSubscriptionResultModel(grpcModel: self)
    }
}


