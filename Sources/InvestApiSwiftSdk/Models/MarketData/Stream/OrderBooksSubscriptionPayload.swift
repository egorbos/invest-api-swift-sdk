import Foundation

/// Сообщение с результатами подписки на стаканы.
public struct OrderBooksSubscriptionPayload: StreamData {
    public typealias StreamDataType = OrderBooksSubscriptionResult
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .subscriptionInfo
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: OrderBooksSubscriptionResult
}

internal extension OrderBooksSubscriptionPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeOrderBookResponse.toModel()
        )
    }
}
