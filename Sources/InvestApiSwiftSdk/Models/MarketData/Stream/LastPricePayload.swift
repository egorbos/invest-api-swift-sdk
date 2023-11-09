import Foundation

/// Сообщение с информацией о цене последней сделки.
public protocol LastPricePayload: StreamData where StreamDataType == LastPrice {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: LastPrice { get }
}

internal struct LastPricePayloadModel: LastPricePayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: LastPrice
}

internal extension LastPricePayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.lastPrice.toModel()
        )
    }
}
