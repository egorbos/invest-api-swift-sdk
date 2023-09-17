/// Тип идентификатора инструмента.
public enum InstrumentIdType: Int, Codable {
    /// Значение не определено.
    case unspecified
    
    /// Figi.
    case figi
    
    /// Ticker.
    case ticker
    
    /// Уникальный идентификатор.
    case uid
    
    /// Идентификатор позиции.
    case positionUid
}
