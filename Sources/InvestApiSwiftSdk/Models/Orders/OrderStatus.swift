/// Текущий статус биржевой заявки (поручения).
public enum OrderStatus: Int, Codable {
    /// Значение не указано.
    case unspecified
    
    /// Исполнена.
    case fill
    
    /// Отклонена.
    case rejected
    
    /// Отменена пользователем.
    case cancelled
    
    /// Новая.
    case new
    
    /// Частично исполнена.
    case partiallyFill
}
