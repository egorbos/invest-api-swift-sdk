import Foundation

/// Сообщение со свечой.
public protocol CandlePayload: StreamData where StreamDataType == Candle {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: Candle { get }
}

internal struct CandlePayloadModel: CandlePayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: Candle
}

internal extension CandlePayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.candle.toModel()
        )
    }
}
