import Foundation

/// Сообщение с результатами подписки на потоки обезличенных сделок.
public protocol TradesSubscriptionPayload: StreamData where StreamDataType == TradesSubscriptionResult {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .subscriptionInfo
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: TradesSubscriptionResult { get }
}

internal struct TradesSubscriptionPayloadModel: TradesSubscriptionPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: TradesSubscriptionResult
}

internal extension TradesSubscriptionPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeTradesResponse.toModel()
        )
    }
}
