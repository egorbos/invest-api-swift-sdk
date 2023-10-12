/// Тип операции со списком подписок.
public enum SubscriptionAction: Int, Codable {
    /// Статус подписки не определён.
    case unspecified
    
    /// Подписаться.
    case subscribe
    
    /// Отписаться.
    case unsubscribe
}
