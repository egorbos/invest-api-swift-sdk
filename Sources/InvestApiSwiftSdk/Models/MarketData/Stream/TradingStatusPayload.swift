import Foundation

/// Сообщение с информацией о торговом статусе
public struct TradingStatusPayload: StreamData {
    public typealias StreamDataType = TradingStatus
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .data
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: TradingStatus
}

internal extension TradingStatusPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse) {
        self.init(
            time: Date(),
            type: .data,
            data: response.tradingStatus.toModel()
        )
    }
}

