import Foundation

/// Сообщение с информацией о совершенной сделке.
public struct TradesStreamPayload: StreamData {
    public typealias StreamDataType = TradeStreamItem
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .data
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: TradeStreamItem
}

internal extension TradesStreamPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse) {
        self.time = Date()
        self.type = .data
        self.data = response.orderTrades.toModel()
    }
}
