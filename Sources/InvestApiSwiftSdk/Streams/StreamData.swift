import Foundation

/// Сообщение получаемое из потока.
public protocol StreamData: Codable {
    associatedtype StreamDataType
    
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки
    var data: StreamDataType { get }
    
    /// Полезная нагрузка сообщения.
    var type: StreamPayloadType { get }
}
