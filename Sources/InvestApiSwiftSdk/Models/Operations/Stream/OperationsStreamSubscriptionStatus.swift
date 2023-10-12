/// Статус подписки.
public enum OperationsStreamSubscriptionStatus: Int, Codable {
    /// Статус подписки не определён.
    case unspecified
    
    /// Успешно.
    case success
    
    /// Счёт не найден или недостаточно прав.
    case accountNotFound
    
    /// Произошла ошибка.
    case internalError
}
