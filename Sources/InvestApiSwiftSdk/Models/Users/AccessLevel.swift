/// Уровень доступа к счёту.
public enum AccessLevel: Int, Codable {
    /// Уровень доступа не определён.
    case unspecified
    
    /// Полный доступ к счёту.
    case fullAccess
    
    /// Доступ с уровнем прав "только чтение".
    case readOnly
    
    /// Доступ отсутствует.
    case noAccess
}
