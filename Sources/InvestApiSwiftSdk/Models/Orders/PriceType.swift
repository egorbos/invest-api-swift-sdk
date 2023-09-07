/// Тип цены.
public enum PriceType: Int, Codable {
    /// Значение не указано.
    case unspecified
    
    /// Цена в пунктах (только для фьючерсов и облигаций).
    case point
    
    /// Цена в валюте расчётов по инструменту.
    case currency
}
