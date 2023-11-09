import Foundation

/// Информация о свече.
public protocol HistoricalCandle {
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
    
    /// Признак завершённости свечи.
    var isComplete: Bool { get }
}

internal struct HistoricalCandleModel: HistoricalCandle {
    let open: Quotation
    
    let high: Quotation
    
    let low: Quotation
    
    let close: Quotation
    
    let volume: Int64
    
    let time: Date
    
    let isComplete: Bool
}

internal extension HistoricalCandleModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_HistoricCandle) {
        self.open = grpcModel.open.toModel()
        self.high = grpcModel.high.toModel()
        self.low = grpcModel.low.toModel()
        self.close = grpcModel.close.toModel()
        self.volume = grpcModel.volume
        self.time = grpcModel.time.date
        self.isComplete = grpcModel.isComplete
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_HistoricCandle {
    func toModel() -> HistoricalCandleModel {
        HistoricalCandleModel(grpcModel: self)
    }
}
