import Foundation

/// Торговый / неторговый день.
public struct TradingDay: Codable {
    /// Дата.
    public let date: Date
    
    /// Признак торгового дня на бирже.
    public let isTradingDay: Bool
    
    /// Время начала торгов по часовому поясу UTC.
    public let startTime: Date
    
    /// Время окончания торгов по часовому поясу UTC.
    public let endTime: Date
    
    /// Время начала аукциона открытия в часовом поясе UTC.
    public let openingAuctionStartTime: Date
    
    /// Время окончания аукциона закрытия в часовом поясе UTC.
    public let closingAuctionEndTime: Date
    
    /// Время начала аукциона открытия вечерней сессии в часовом поясе UTC.
    public let eveningOpeningAuctionStartTime: Date
    
    /// Время начала вечерней сессии в часовом поясе UTC.
    public let eveningStartTime: Date
    
    /// Время окончания вечерней сессии в часовом поясе UTC.
    public let eveningEndTime: Date
    
    /// Время начала основного клиринга в часовом поясе UTC.
    public let clearingStartTime: Date
    
    /// Время окончания основного клиринга в часовом поясе UTC.
    public let clearingEndTime: Date
    
    /// Время начала премаркета в часовом поясе UTC.
    public let premarketStartTime: Date
    
    /// Время окончания премаркета в часовом поясе UTC.
    public let premarketEndTime: Date
    
    /// Время начала аукциона закрытия в часовом поясе UTC.
    public let closingAuctionStartTime: Date
    
    /// Время окончания аукциона открытия в часовом поясе UTC.
    public let openingAuctionEndTime: Date
}

internal extension TradingDay {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_TradingDay) {
        self.date = grpcModel.date.date
        self.isTradingDay = grpcModel.isTradingDay
        self.startTime = grpcModel.startTime.date
        self.endTime = grpcModel.endTime.date
        self.openingAuctionStartTime = grpcModel.openingAuctionStartTime.date
        self.closingAuctionEndTime = grpcModel.closingAuctionEndTime.date
        self.eveningOpeningAuctionStartTime = grpcModel.eveningOpeningAuctionStartTime.date
        self.eveningStartTime = grpcModel.eveningStartTime.date
        self.eveningEndTime = grpcModel.eveningEndTime.date
        self.clearingStartTime = grpcModel.clearingStartTime.date
        self.clearingEndTime = grpcModel.clearingEndTime.date
        self.premarketStartTime = grpcModel.premarketStartTime.date
        self.premarketEndTime = grpcModel.premarketEndTime.date
        self.closingAuctionStartTime = grpcModel.closingAuctionStartTime.date
        self.openingAuctionEndTime =  grpcModel.openingAuctionEndTime.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradingDay {
    func toModel() -> TradingDay {
        TradingDay(grpcModel: self)
    }
}
