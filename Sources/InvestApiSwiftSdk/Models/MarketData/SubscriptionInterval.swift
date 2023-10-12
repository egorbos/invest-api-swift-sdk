/// Интервал свечи.
public enum SubscriptionInterval: Int, Codable {
    /// Интервал не определён.
    case unspecified
    
    /// Одна минута.
    case oneMinute
    
    /// Пять минут.
    case fiveMinutes
}
