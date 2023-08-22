/// Статус запрашиваемых операций.
public enum OperationState: Int, Codable {
    /// Не определён.
    case unspecified
    
    /// Исполнена.
    case executed
    
    /// Отменена.
    case canceled
    
    /// Исполняется.
    case progress
}
