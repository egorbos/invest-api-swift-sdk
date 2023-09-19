import Foundation

/// Информация о сделке.
public struct OrderTrade {
    /// Идентификатор сделки.
    let tradeId: String
    
    /// Цена по которой совершена сделка (за 1 штуку).
    let price: Quotation
    
    /// Количество штук в сделке.
    let quantity: Int64
    
    /// Дата и время совершения сделки в часовом поясе UTC.
    let time: Date
}

internal extension OrderTrade {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderTrade) {
        self.tradeId = grpcModel.tradeID
        self.price = grpcModel.price.toModel()
        self.quantity = grpcModel.quantity
        self.time = grpcModel.dateTime.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderTrade {
    func toModel() -> OrderTrade {
        OrderTrade(grpcModel: self)
    }
}
