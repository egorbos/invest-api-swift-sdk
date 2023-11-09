/// Ордер на покупку / продажу инструмента.
public protocol Order {
    /// Цена за 1 инструмент.
    var price: Quotation { get }
    
    /// Количество в лотах.
    ///
    /// ```
    /// Для получения стоимости лота требуется умножить на лотность инструмента.
    /// ```
    var quantity: Int64 { get }
}

internal struct OrderModel: Order {
    let price: Quotation
    
    let quantity: Int64
}

internal extension OrderModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Order) {
        self.price = grpcModel.price.toModel()
        self.quantity = grpcModel.quantity
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Order {
    func toModel() -> OrderModel {
        OrderModel(grpcModel: self)
    }
}
