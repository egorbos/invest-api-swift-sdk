import Foundation

/// Сообщение по изменению позиций портфеля.
public struct PositionsStreamPayload: StreamData {
    public typealias StreamDataType = PositionsStreamItem
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .data
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: PositionsStreamItem
}

internal extension PositionsStreamPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse) {
        self.time = Date()
        self.type = .data
        self.data = response.position.toModel()
    }
}
