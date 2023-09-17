/// Вид инструмента.
public enum InstrumentKind: Int, Codable {
    /// Значение не определено.
    case unspecified
    
    /// Облигация.
    case bond
    
    /// Акция.
    case share
    
    /// Валюта.
    case currency
    
    /// Фонд.
    case etf
    
    /// Фьючерсный контракт.
    case future
    
    /// Структурный продукт.
    case structuredProduct
    
    /// Опционный контракт.
    case option
    
    /// Клиринговый сертификат участия.
    case clearingCertificate
}
