import Foundation

/// Сообщение с информацией о цене последней сделки.
public struct LastPricePayload: StreamData {
    public typealias StreamDataType = LastPrice
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .data
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: LastPrice
}

internal extension LastPricePayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.lastPrice.toModel()
        )
    }
}
