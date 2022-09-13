/// Статус счёта.
public enum AccountStatus: Int, Codable {
    /// Статус счёта не определён.
    case unspecified
    
    /// Новый, в процессе открытия.
    case new
    
    /// Открытый и активный счёт.
    case open
    
    /// Закрытый счёт.
    case closed
}
