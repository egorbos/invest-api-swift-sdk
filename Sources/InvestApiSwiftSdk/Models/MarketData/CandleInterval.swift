/// Интервал свечей.
public enum CandleInterval: Int, Codable {
    /// Интервал не определён.
    case unspecified
    
    /// Одна минута.
    case oneMinute
    
    /// Пять минут.
    case fiveMinutes
    
    /// Пятнадцать минут.
    case fifteenMinutes
    
    /// Один час.
    case oneHour
    
    /// Один день.
    case oneDay
}
