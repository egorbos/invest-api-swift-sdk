/// Ордер на покупку / продажу инструмента.
public struct Order: Codable {
    /// Цена за 1 инструмент.
    public let price: Quotation
    
    /// Количество в лотах.
    ///
    /// ```
    /// Для получения стоимости лота требуется умножить на лотность инструмента.
    /// ```
    public let quantity: Int64
}

internal extension Order {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Order) {
        self.price = grpcModel.price.toModel()
        self.quantity = grpcModel.quantity
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Order {
    func toModel() -> Order {
        Order(grpcModel: self)
    }
}
