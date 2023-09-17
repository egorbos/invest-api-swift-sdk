/// Тип базового актива фьючерсного контракта.
public enum FutureAssetType: String, Codable {
    /// Товар.
    case commodity
    
    /// Валюта
    case currency
    
    /// Ценная бумага
    case security
    
    /// Индекс.
    case index
}
