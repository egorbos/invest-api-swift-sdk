import Foundation

/// Сделка по операции.
public struct OperationTrade: Codable {
    /// Идентификатор сделки.
    let tradeId: String
    
    /// Дата и время сделки в часовом поясе UTC.
    let date: Date
    
    /// Количество инструментов.
    let quantity: Int64
    
    /// Цена за 1 инструмент.
    let price: MoneyValue
}

internal extension OperationTrade {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OperationTrade) {
        self.tradeId = grpcModel.tradeID
        self.date = grpcModel.dateTime.date
        self.quantity = grpcModel.quantity
        self.price = grpcModel.price.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OperationTrade {
    func toModel() -> OperationTrade {
        OperationTrade(grpcModel: self)
    }
}
