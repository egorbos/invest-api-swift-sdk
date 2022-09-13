/// Тип счёта.
public enum AccountType: Int, Codable {
    /// Тип аккаунта не определён.
    case unspecified
    
    /// Брокерский счёт Тинькофф.
    case tinkoff
    
    /// ИИС счёт.
    case tinkoffIis
    
    /// Инвесткопилка.
    case investBox
}
