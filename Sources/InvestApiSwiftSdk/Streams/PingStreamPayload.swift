import Foundation

/// Сообщение для проверки (поддержания) соединения.
public protocol PingStreamPayload: StreamData where StreamDataType == Date {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .ping
    var type: StreamPayloadType { get }
    
    /// Время отправки сообщения.
    var data: Date { get }
}

internal struct PingStreamPayloadModel: PingStreamPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: Date
}

internal extension PingStreamPayloadModel {
    init(sendedAt: Date) {
        self.time = Date()
        self.type = .ping
        self.data = sendedAt
    }
}
