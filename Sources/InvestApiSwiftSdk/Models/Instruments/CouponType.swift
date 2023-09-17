/// Тип купона.
public enum CouponType: Int, Codable {
    /// Значение не определено.
    case unspecified
    
    /// Постоянный.
    case constant
    
    /// Плавающий.
    case floating
    
    /// Дисконт.
    case discount
    
    /// Ипотечный.
    case mortage
    
    /// Фиксированный.
    case fix
    
    /// Переменный.
    case variable
    
    /// Прочее.
    case other
}