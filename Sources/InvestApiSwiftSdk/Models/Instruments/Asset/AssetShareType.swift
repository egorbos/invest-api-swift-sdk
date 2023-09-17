/// Тип акции.
enum AssetShareType: Int, Codable {
    /// Значение не определено.
    case unspecified
    
    /// Обыкновенная.
    case common
    
    /// Привилегированная.
    case preferred
    
    /// Американские депозитарные расписки.
    case adr
    
    /// Глобальные депозитарные расписки.
    case gdr
    
    /// Товарищество с ограниченной ответственностью.
    case mlp
    
    /// Акции из реестра нью-йорка.
    case nyRegShrs
    
    /// Закрытый инвестиционный фонд.
    case closedEndFund
    
    /// Траст недвижимости.
    case reit
}