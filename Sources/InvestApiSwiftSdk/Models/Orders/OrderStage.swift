/// Сделка в рамках торгового поручения.
public struct OrderStage: Codable {
    /// Цена за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    let price: MoneyValue
    
    /// Количество лотов.
    let quantity: Int64
    
    /// Идентификатор сделки.
    let tradeId: String
}

internal extension OrderStage {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderStage) {
        self.price = grpcModel.price.toModel()
        self.quantity = grpcModel.quantity
        self.tradeId = grpcModel.tradeID
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderStage {
    func toModel() -> OrderStage {
        OrderStage(grpcModel: self)
    }
}
