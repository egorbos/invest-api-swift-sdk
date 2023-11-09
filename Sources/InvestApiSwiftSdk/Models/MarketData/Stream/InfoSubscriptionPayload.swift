import Foundation

/// Сообщение с результатами подписки на потоки торговых статусов.
public protocol InfoSubscriptionPayload: StreamData where StreamDataType == InfoSubscriptionResult {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .subscriptionInfo
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: InfoSubscriptionResult { get }
}

internal struct InfoSubscriptionPayloadModel: InfoSubscriptionPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: InfoSubscriptionResult
}

internal extension InfoSubscriptionPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeInfoResponse.toModel()
        )
    }
}
