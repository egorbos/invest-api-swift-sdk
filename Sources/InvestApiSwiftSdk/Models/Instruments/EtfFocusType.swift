/// Направление инвистирования фонда.
public enum EtfFocusType: String, Codable {
    /// Акции.
    case equity

    /// Облигации.
    case fixedIncome = "fixed_income"

    /// Смешанный.
    case mixedAllocation = "mixed_allocation"

    /// Денежный рынок.
    case moneyMarket = "money_market"

    /// Недвижимость.
    case realEstate = "real_estate"

    /// Товары.
    case commodity

    /// Специальный.
    case specialty
    
    /// Private equity.
    case privateEquity = "private_equity"
    
    /// Альтернативные инвестиции.
    case alternativeInvestment = "alternative_investment"
}
