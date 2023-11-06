/// Тип фьючерсного контракта.
public enum FutureContractType: String, Codable {
    /// Поставочный.
    case physicalDelivery = "DELIVERY_TYPE_PHYSICAL_DELIVERY"
    
    /// Расчётный.
    case cashSettlement = "DELIVERY_TYPE_CASH_SETTLEMENT"
}
