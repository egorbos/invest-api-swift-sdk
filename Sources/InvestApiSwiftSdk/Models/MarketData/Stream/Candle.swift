import Foundation

/// Информация о свече.
public struct Candle: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Уникальный идентификатор инструмента.
    let uid: String
    
    /// Интервал свечи.
    let interval: CandleInterval
    
    /// Цена открытия (1 единица).
    let open: Quotation
    
    /// Максимальная цена (1 единица).
    let high: Quotation
    
    /// Минимальная цена (1 единица).
    let low: Quotation
    
    /// Цена закрытия (1 единица).
    let close: Quotation
    
    /// Объём торгов в лотах.
    let volume: Int64
    
    /// Время начала интервала свечи в часовом поясе UTC.
    let time: Date
    
    /// Время последней сделки в часовом поясе UTC.
    let lastTradeTime: Date
}

internal extension Candle {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Candle) {
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.interval = CandleInterval(rawValue: grpcModel.interval.rawValue) ?? .unspecified
        self.open = grpcModel.open.toModel()
        self.high = grpcModel.high.toModel()
        self.low = grpcModel.low.toModel()
        self.close = grpcModel.close.toModel()
        self.volume = grpcModel.volume
        self.time = grpcModel.time.date
        self.lastTradeTime = grpcModel.lastTradeTs.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Candle {
    func toModel() -> Candle {
        Candle(grpcModel: self)
    }
}
