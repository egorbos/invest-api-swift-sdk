import Foundation

/// Информация о свече.
public protocol Candle {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Уникальный идентификатор инструмента.
    var uid: String { get }
    
    /// Интервал свечи.
    var interval: CandleInterval { get }
    
    /// Цена открытия (1 единица).
    var open: Quotation { get }
    
    /// Максимальная цена (1 единица).
    var high: Quotation { get }
    
    /// Минимальная цена (1 единица).
    var low: Quotation { get }
    
    /// Цена закрытия (1 единица).
    var close: Quotation { get }
    
    /// Объём торгов в лотах.
    var volume: Int64 { get }
    
    /// Время начала интервала свечи в часовом поясе UTC.
    var time: Date { get }
    
    /// Время последней сделки в часовом поясе UTC.
    var lastTradeTime: Date { get }
}

internal struct CandleModel: Candle {
    let figi: String
    
    let uid: String
    
    let interval: CandleInterval
    
    let open: Quotation
    
    let high: Quotation
    
    let low: Quotation
    
    let close: Quotation
    
    let volume: Int64
    
    let time: Date
    
    let lastTradeTime: Date
}

internal extension CandleModel {
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
    func toModel() -> CandleModel {
        CandleModel(grpcModel: self)
    }
}
