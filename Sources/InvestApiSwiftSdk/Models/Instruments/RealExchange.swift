/// Площадка исполнения расчётов (биржа).
public enum RealExchange: Int, Codable {
    /// Значение не определено.
    case unspecified

    /// Московская биржа.
    case moex
    
    /// Санкт-Петербургская биржа.
    case rts
    
    /// Внебиржевой инструмент.
    case otc
}
