import Foundation

/// Сообщение с результатами подписки на цены последних сделок.
public protocol LastPricesSubscriptionPayload: StreamData where StreamDataType == LastPricesSubscriptionResult {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .subscriptionInfo
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: LastPricesSubscriptionResult { get }
}

internal struct LastPricesSubscriptionPayloadModel: LastPricesSubscriptionPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: LastPricesSubscriptionResult
}

internal extension LastPricesSubscriptionPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .subscriptionInfo,
            data: response.subscribeLastPriceResponse.toModel()
        )
    }
}
