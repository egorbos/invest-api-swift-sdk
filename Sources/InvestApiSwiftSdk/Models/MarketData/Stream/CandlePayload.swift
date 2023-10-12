import Foundation

/// Сообщение со свечой.
public struct CandlePayload: StreamData {
    public typealias StreamDataType = Candle
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .data
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: Candle
}

internal extension CandlePayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.candle.toModel()
        )
    }
}
