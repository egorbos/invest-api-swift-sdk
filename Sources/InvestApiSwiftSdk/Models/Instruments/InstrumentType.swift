/// Тип инструмента.
public enum InstrumentType: String, Codable {
    /// Значение не установлено.
    case unspecified
    
    /// Акция.
    case share
    
    /// Облигация.
    case bond
    
    /// Фонд.
    case etf
    
    /// Фьючерс.
    case futures
    
    /// Опцион.
    case option
    
    /// Валюта.
    case currency
}
