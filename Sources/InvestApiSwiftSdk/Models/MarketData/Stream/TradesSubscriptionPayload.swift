import Foundation

/// Сообщение с результатами подписки на потоки обезличенных сделок.
public struct TradesSubscriptionPayload: StreamData {
    public typealias StreamDataType = TradesSubscriptionResult
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .subscriptionInfo
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: TradesSubscriptionResult
}

internal extension TradesSubscriptionPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeTradesResponse.toModel()
        )
    }
}
