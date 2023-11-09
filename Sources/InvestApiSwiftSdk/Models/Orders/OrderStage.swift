/// Сделка в рамках торгового поручения.
public protocol OrderStage {
    /// Цена за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    var price: MoneyValue { get }
    
    /// Количество лотов.
    var quantity: Int64 { get }
    
    /// Идентификатор сделки.
    var tradeId: String { get }
}

internal struct OrderStageModel: OrderStage {
    let price: MoneyValue
    
    let quantity: Int64
    
    let tradeId: String
}

internal extension OrderStageModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderStage) {
        self.price = grpcModel.price.toModel()
        self.quantity = grpcModel.quantity
        self.tradeId = grpcModel.tradeID
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderStage {
    func toModel() -> OrderStageModel {
        OrderStageModel(grpcModel: self)
    }
}
