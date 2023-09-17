/// Тип опционного контракта по способу исполнения.
public enum OptionContractType: Int, Codable {
    /// Значение не определено.
    case unspecified
    
    /// Поставочный.
    case physicalDelivery
    
    /// Расчётный.
    case cashSettlement
}
