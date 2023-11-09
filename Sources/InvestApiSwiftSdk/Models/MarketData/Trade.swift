import Foundation

/// Информация о сделке.
public protocol Trade {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Уникальный идентификатор инструмента.
    var uid: String { get }
    
    /// Направление сделки.
    var direction: TradeDirection { get }
    
    /// Цена (1 единица).
    var price: Quotation { get }
    
    /// Количество лотов.
    var quantity: Int64 { get }
    
    /// Время сделки в часовом поясе UTC по времени биржи.
    var time: Date { get }
}

internal struct TradeModel: Trade {
    let figi: String
    
    let uid: String
    
    let direction: TradeDirection
    
    let price: Quotation
    
    let quantity: Int64
    
    let time: Date
}

internal extension TradeModel {
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
    func toModel() -> TradeModel {
        TradeModel(grpcModel: self)
    }
}
