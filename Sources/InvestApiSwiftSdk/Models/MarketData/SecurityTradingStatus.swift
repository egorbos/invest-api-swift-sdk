/// Статус торговли инструментом.
public enum SecurityTradingStatus: Int, Codable {
    /// Торговый статус не определён.
    case unspecified
    
    /// Недоступен для торгов.
    case notAvailableForTrading
    
    /// Период открытия торгов.
    case openingPeriod
    
    /// Период закрытия торгов.
    case closingPeriod
    
    /// Перерыв в торговле.
    case breakInTrading
    
    /// Нормальная торговля.
    case normalTrading
    
    /// Аукцион закрытия.
    case closingAuction
    
    /// Аукцион крупных пакетов.
    case darkPoolAuction
    
    /// Дискретный аукцион.
    case discreteAuction
    
    /// Аукцион открытия.
    case openingAuctionPeriod
    
    /// Период торгов по цене аукциона закрытия.
    case tradingAtClosingAuctionPrice
    
    /// Сессия назначена.
    case sessionAssigned
    
    /// Сессия закрыта.
    case sessionClose
    
    /// Сессия открыта.
    case sessionOpen
    
    /// Доступна торговля в режиме внутренней ликвидности брокера.
    case dealerNormalTrading
    
    /// Перерыв торговли в режиме внутренней ликвидности брокера.
    case dealerBreakInTrading
    
    /// Недоступна торговля в режиме внутренней ликвидности брокера.
    case dealerNotAvailableForTrading
}
