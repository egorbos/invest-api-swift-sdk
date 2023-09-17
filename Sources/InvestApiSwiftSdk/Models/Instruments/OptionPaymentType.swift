/// Тип расчетов по опционному контракту.
public enum OptionPaymentType: Int, Codable {
    /// Значение не определено.
    case unspecified
    
    /// Контракт с использованием премии в расчетах.
    case premiun
    
    /// Маржируемый контракт.
    case marginal
}
