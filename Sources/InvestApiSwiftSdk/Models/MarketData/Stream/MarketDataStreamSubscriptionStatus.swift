/// Статус подписки.
public enum MarketDataStreamSubscriptionStatus: Int, Codable {
    /// Статус подписки не определён.
    case unspecified
    
    /// Успешно.
    case success
    
    /// Инструмент не найден.
    case instrumentNotFound
    
    /// Некорректное значение `SubscriptionAction`.
    case subscriptionActionIsInvalid
    
    /// Некорректная глубина стакана. Возможные значения: 1, 10, 20, 30, 40, 50.
    case depthIsInvalid
    
    /// Некорректный интервал свечей. Возможные значения: .oneMinute, .fiveMinutes.
    case intervalIsInvalid
    
    /// Превышен лимит на общее количество подписок в рамках потока.
    case limitIsExceeded
    
    /// Внутренняя ошибка сервиса.
    case internalError
    
    /// Превышен лимит на количество запросов подписки в течение установленного интервала времени.
    case tooManyRequests
    
    /// Активная подписка не найдена (возникает при попытке отписаться от несуществующей подписки).
    case subscriptionNotFound
}
