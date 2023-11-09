import Foundation

/// Сообщение с результатами подписки на стаканы.
public protocol OrderBooksSubscriptionPayload: StreamData where StreamDataType == OrderBooksSubscriptionResult {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .subscriptionInfo
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: OrderBooksSubscriptionResult { get }
}

internal struct OrderBooksSubscriptionPayloadModel: OrderBooksSubscriptionPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: OrderBooksSubscriptionResult
}

internal extension OrderBooksSubscriptionPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeOrderBookResponse.toModel()
        )
    }
}
