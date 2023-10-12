import Foundation

/// Сообщение с информацией о стакане.
public struct OrderBookPayload: StreamData {
    public typealias StreamDataType = OrderBook
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .data
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: OrderBook
}

internal extension OrderBookPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.orderbook.toModel()
        )
    }
}
