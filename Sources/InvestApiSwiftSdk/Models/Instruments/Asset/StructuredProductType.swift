/// Тип структурной ноты.
enum StructuredProductType: Int, Codable {
    /// Значение не определено.
    case unspecified
    
    /// Поставочный.
    case deliverable
    
    /// Беспоставочный.
    case nonDeliverable
}