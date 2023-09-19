import Foundation

/// Информация о сделке.
public struct Trade: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Направление сделки.
    let direction: TradeDirection
    
    /// Цена (1 единица).
    let price: Quotation
    
    /// Количество лотов.
    let quantity: Int64
    
    /// Время сделки в часовом поясе UTC по времени биржи.
    let time: Date
}

internal extension Trade {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Trade) throws {
        self.figi = grpcModel.figi
        self.direction = try .new(rawValue: grpcModel.direction.rawValue)
        self.price = grpcModel.price.toModel()
        self.quantity = grpcModel.quantity
        self.time = grpcModel.time.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Trade {
    func toModel() throws -> Trade {
        try Trade(grpcModel: self)
    }
}
