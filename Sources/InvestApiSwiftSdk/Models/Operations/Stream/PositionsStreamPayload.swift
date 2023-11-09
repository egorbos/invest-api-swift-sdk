import Foundation

/// Сообщение по изменению позиций портфеля.
public protocol PositionsStreamPayload: StreamData where StreamDataType == PositionsStreamItem {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: PositionsStreamItem { get }
}

internal struct PositionsStreamPayloadModel: PositionsStreamPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: PositionsStreamItem
}

internal extension PositionsStreamPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse) {
        self.time = Date()
        self.type = .data
        self.data = response.position.toModel()
    }
}
