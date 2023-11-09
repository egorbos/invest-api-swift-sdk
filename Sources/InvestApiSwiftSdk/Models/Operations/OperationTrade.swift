import Foundation

/// Сделка по операции.
public protocol OperationTrade {
    /// Идентификатор сделки.
    var tradeId: String { get }
    
    /// Дата и время сделки в часовом поясе UTC.
    var date: Date { get }
    
    /// Количество инструментов.
    var quantity: Int64 { get }
    
    /// Цена за 1 инструмент.
    var price: MoneyValue { get }
}

internal struct OperationTradeModel: OperationTrade {
    let tradeId: String
    
    let date: Date
    
    let quantity: Int64
    
    let price: MoneyValue
}

internal extension OperationTradeModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OperationTrade) {
        self.tradeId = grpcModel.tradeID
        self.date = grpcModel.dateTime.date
        self.quantity = grpcModel.quantity
        self.price = grpcModel.price.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OperationTrade {
    func toModel() -> OperationTradeModel {
        OperationTradeModel(grpcModel: self)
    }
}
