/// Тип инструмента.
public enum InstrumentType: String, Codable {
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
