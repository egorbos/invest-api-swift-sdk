/// Форма выпуска.
public enum IssueKindType: String, Codable {
    /// Документарная.
    case documentary
    
    /// Бездокументарная.
    case nonDocumentary = "non_documentary"
}
