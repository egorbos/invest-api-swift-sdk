import Foundation

/// Сообщение для проверки (поддержания) соединения.
public struct PingStreamPayload: StreamData {
    public typealias StreamDataType = Date
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .ping
    public let type: StreamPayloadType
    
    /// Время отправки сообщения.
    public let data: Date
}

internal extension PingStreamPayload {
    init(sendedAt: Date) {
        self.time = Date()
        self.type = .ping
        self.data = sendedAt
    }
}
