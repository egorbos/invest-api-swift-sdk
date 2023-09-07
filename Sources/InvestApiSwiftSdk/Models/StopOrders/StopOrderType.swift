/// Тип заявки.
public enum StopOrderType: Int, Codable {
    /// Значение не указано.
    case unspecified
    
    /// Take-profit заявка.
    case takeProfit
    
    /// Stop-loss заявка.
    case stopLoss
    
    /// Stop-limit заявка.
    case stopLimit
}
