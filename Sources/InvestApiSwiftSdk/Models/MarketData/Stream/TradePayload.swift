import Foundation

/// Сообщение с информацией о сделке.
public protocol TradePayload: StreamData where StreamDataType == Trade {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: Trade { get }
}

internal struct TradePayloadModel: TradePayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: Trade
}

internal extension TradePayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.trade.toModel()
        )
    }
}
