import Foundation

/// Сообщение с результатом подписки на свечи.
public protocol CandlesSubscriptionPayload: StreamData where StreamDataType == CandlesSubscriptionResult {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .subscriptionInfo
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: CandlesSubscriptionResult { get }
}

internal struct CandlesSubscriptionPayloadModel: CandlesSubscriptionPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: CandlesSubscriptionResult
}

internal extension CandlesSubscriptionPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeCandlesResponse.toModel()
        )
    }
}
