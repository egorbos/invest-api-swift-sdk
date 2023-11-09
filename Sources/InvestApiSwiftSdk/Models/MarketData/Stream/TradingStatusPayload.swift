import Foundation

/// Сообщение с информацией о торговом статусе.
public protocol TradingStatusPayload: StreamData where StreamDataType == TradingStatus {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: TradingStatus { get }
}

internal struct TradingStatusPayloadModel: TradingStatusPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: TradingStatus
}

internal extension TradingStatusPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.tradingStatus.toModel()
        )
    }
}

