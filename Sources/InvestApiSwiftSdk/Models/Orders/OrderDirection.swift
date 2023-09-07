/// Направление операции.
public enum OrderDirection: Int, Codable {
    /// Направление не определено.
    case unspecified
    
    /// Покупка.
    case buy
    
    /// Продажа.
    case sell
}
