import Foundation

/// Сообщение с информацией о совершенной сделке.
public protocol TradesStreamPayload: StreamData where StreamDataType == TradeStreamItem {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: TradeStreamItem { get }
}

internal struct TradesStreamPayloadModel: TradesStreamPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: TradeStreamItem
}

internal extension TradesStreamPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse) {
        self.time = Date()
        self.type = .data
        self.data = response.orderTrades.toModel()
    }
}
