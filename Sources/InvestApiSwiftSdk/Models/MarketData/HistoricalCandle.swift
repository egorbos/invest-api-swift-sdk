import Foundation

/// Информация о свече.
public struct HistoricalCandle: Codable {
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
    
    /// Признак завершённости свечи.
    let isComplete: Bool
}

internal extension HistoricalCandle {
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
    func toModel() -> HistoricalCandle {
        HistoricalCandle(grpcModel: self)
    }
}
