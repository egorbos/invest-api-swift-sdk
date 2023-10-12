import Foundation

/// Сообщение с результатами подписки на потоки торговых статусов.
public struct InfoSubscriptionPayload: StreamData {
    public typealias StreamDataType = InfoSubscriptionResult
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .subscriptionInfo
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: InfoSubscriptionResult
}

internal extension InfoSubscriptionPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeInfoResponse.toModel()
        )
    }
}
