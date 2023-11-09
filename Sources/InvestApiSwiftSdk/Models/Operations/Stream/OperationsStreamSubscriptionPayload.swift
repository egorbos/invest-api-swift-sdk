import Foundation

/// Сообщение с результатами подписки на потоки `OperationsStreamService`.
public protocol OperationsStreamSubscriptionPayload: StreamData where StreamDataType == [OperationsStreamSubscriptionResult] {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .subscriptionInfo
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: [OperationsStreamSubscriptionResult] { get }
}

internal struct OperationsStreamSubscriptionPayloadModel: OperationsStreamSubscriptionPayload {
    var time: Date
    
    var type: StreamPayloadType
    
    var data: [OperationsStreamSubscriptionResult]
}

internal extension OperationsStreamSubscriptionPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscriptions.accounts.map { $0.toModel() }
        )
    }
    
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscriptions.accounts.map { $0.toModel() }
        )
    }
}
