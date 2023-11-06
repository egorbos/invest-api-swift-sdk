/// Уровень риска облигации.
public enum RiskLevel: Int, Codable {
    /// Значение не определено.
    case unspecified
    
    /// Низкий уровень.
    case low
    
    /// Средний уровень.
    case moderate
    
    /// Высокий уровень.
    case high
}
