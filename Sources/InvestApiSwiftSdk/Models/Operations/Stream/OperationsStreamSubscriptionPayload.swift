import Foundation

/// Сообщение с результатами подписки на потоки `OperationsStreamService`.
public struct OperationsStreamSubscriptionPayload: StreamData {
    public typealias StreamDataType = [OperationsStreamSubscriptionResult]
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .subscriptionInfo
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: [OperationsStreamSubscriptionResult]
}

internal extension OperationsStreamSubscriptionPayload {
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
