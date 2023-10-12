import Foundation

/// Сообщение с информацией о сделке.
public struct TradePayload: StreamData {
    public typealias StreamDataType = Trade
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .data
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: Trade
}

internal extension TradePayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.trade.toModel()
        )
    }
}
