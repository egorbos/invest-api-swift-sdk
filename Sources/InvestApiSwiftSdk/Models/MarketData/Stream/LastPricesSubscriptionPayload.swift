import Foundation

/// Сообщение с результатами подписки на цены последних сделок.
public struct LastPricesSubscriptionPayload: StreamData {
    public typealias StreamDataType = LastPricesSubscriptionResult
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .subscriptionInfo
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: LastPricesSubscriptionResult
}

internal extension LastPricesSubscriptionPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeLastPriceResponse.toModel()
        )
    }
}
