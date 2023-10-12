import Foundation

/// Информация о сделке.
public struct Trade: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Уникальный идентификатор инструмента.
    let uid: String
    
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
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Trade) {
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.direction = TradeDirection(rawValue: grpcModel.direction.rawValue) ?? .unspecified
        self.price = grpcModel.price.toModel()
        self.quantity = grpcModel.quantity
        self.time = grpcModel.time.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Trade {
    func toModel() -> Trade {
        Trade(grpcModel: self)
    }
}
