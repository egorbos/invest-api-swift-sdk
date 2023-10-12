import Foundation

/// Сообщение с результатом подписки на свечи.
public struct CandlesSubscriptionPayload: StreamData {
    public typealias StreamDataType = CandlesSubscriptionResult
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .subscriptionInfo
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: CandlesSubscriptionResult
}

internal extension CandlesSubscriptionPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeCandlesResponse.toModel()
        )
    }
}
