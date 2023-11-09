import Foundation

/// Информация о сделке.
public protocol OrderTrade {
    /// Идентификатор сделки.
    var tradeId: String { get }
    
    /// Цена по которой совершена сделка (за 1 штуку).
    var price: Quotation { get }
    
    /// Количество штук в сделке.
    var quantity: Int64 { get }
    
    /// Дата и время совершения сделки в часовом поясе UTC.
    var time: Date { get }
}

internal struct OrderTradeModel: OrderTrade {
    let tradeId: String
    
    let price: Quotation
    
    let quantity: Int64
    
    let time: Date
}

internal extension OrderTradeModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderTrade) {
        self.tradeId = grpcModel.tradeID
        self.price = grpcModel.price.toModel()
        self.quantity = grpcModel.quantity
        self.time = grpcModel.dateTime.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderTrade {
    func toModel() -> OrderTradeModel {
        OrderTradeModel(grpcModel: self)
    }
}
