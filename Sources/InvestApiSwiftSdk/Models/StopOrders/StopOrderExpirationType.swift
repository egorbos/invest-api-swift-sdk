/// Тип заявки.
public enum StopOrderExpirationType: Int, Codable {
    /// Значение не указано.
    case unspecified
    
    /// Действует до отмены.
    case goodTillCancel
    
    /// Действует до даты снятия.
    case goodTillDate
}
