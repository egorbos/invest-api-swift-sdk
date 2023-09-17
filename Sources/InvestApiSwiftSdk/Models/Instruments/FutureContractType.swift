/// Тип фьючерсного контракта.
public enum FutureContractType: String, Codable {
    /// Поставочный.
    case physicalDelivery = "physical_delivery"
    
    /// Расчётный.
    case cashSettlement = "cash_settlement"
}
