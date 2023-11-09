import Foundation

/// Сообщение получаемое из потока.
public protocol StreamData {
    associatedtype StreamDataType
    
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки.
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: StreamDataType { get }
}
