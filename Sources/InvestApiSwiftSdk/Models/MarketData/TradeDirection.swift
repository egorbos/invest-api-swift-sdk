/// Направление сделки.
public enum TradeDirection: Int, Codable {
    /// Интервал не определён.
    case unspecified
    
    /// Покупка.
    case buy
    
    /// Продажа.
    case sell
}
