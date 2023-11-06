import Foundation

/// Информация о свече.
public struct HistoricalCandle: Codable {
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
    
    /// Признак завершённости свечи.
    public let isComplete: Bool
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
