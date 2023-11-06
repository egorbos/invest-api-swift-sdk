/// Тип базового актива контракта.
public enum ContractAssetType: String, Codable {
    /// Товар.
    case commodity = "TYPE_COMMODITY"
    
    /// Валюта
    case currency = "TYPE_CURRENCY"
    
    /// Ценная бумага
    case security = "TYPE_SECURITY"
    
    /// Индекс.
    case index = "TYPE_INDEX"
}
