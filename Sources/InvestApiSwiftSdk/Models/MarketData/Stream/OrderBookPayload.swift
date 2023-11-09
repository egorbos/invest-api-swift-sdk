import Foundation

/// Сообщение с информацией о стакане.
public protocol OrderBookPayload: StreamData where StreamDataType == OrderBook {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: OrderBook { get }
}

internal struct OrderBookPayloadModel: OrderBookPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: OrderBook
}

internal extension OrderBookPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.orderbook.toModel()
        )
    }
}
