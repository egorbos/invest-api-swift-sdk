import Foundation

/// Информация о свече.
public struct Candle: Codable {
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Уникальный идентификатор инструмента.
    public let uid: String
    
    /// Интервал свечи.
    public let interval: CandleInterval
    
    /// Цена открытия (1 единица).
    public let open: Quotation
    
    /// Максимальная цена (1 единица).
    public let high: Quotation
    
    /// Минимальная цена (1 единица).
    public let low: Quotation
    
    /// Цена закрытия (1 единица).
    public let close: Quotation
    
    /// Объём торгов в лотах.
    public let volume: Int64
    
    /// Время начала интервала свечи в часовом поясе UTC.
    public let time: Date
    
    /// Время последней сделки в часовом поясе UTC.
    public let lastTradeTime: Date
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
