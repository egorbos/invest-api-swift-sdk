import Foundation

/// Торговый / неторговый день.
public protocol TradingDay {
    /// Дата.
    var date: Date { get }
    
    /// Признак торгового дня на бирже.
    var isTradingDay: Bool { get }
    
    /// Время начала торгов по часовому поясу UTC.
    var startTime: Date { get }
    
    /// Время окончания торгов по часовому поясу UTC.
    var endTime: Date { get }
    
    /// Время начала аукциона открытия в часовом поясе UTC.
    var openingAuctionStartTime: Date { get }
    
    /// Время окончания аукциона закрытия в часовом поясе UTC.
    var closingAuctionEndTime: Date { get }
    
    /// Время начала аукциона открытия вечерней сессии в часовом поясе UTC.
    var eveningOpeningAuctionStartTime: Date { get }
    
    /// Время начала вечерней сессии в часовом поясе UTC.
    var eveningStartTime: Date { get }
    
    /// Время окончания вечерней сессии в часовом поясе UTC.
    var eveningEndTime: Date { get }
    
    /// Время начала основного клиринга в часовом поясе UTC.
    var clearingStartTime: Date { get }
    
    /// Время окончания основного клиринга в часовом поясе UTC.
    var clearingEndTime: Date { get }
    
    /// Время начала премаркета в часовом поясе UTC.
    var premarketStartTime: Date { get }
    
    /// Время окончания премаркета в часовом поясе UTC.
    var premarketEndTime: Date { get }
    
    /// Время начала аукциона закрытия в часовом поясе UTC.
    var closingAuctionStartTime: Date { get }
    
    /// Время окончания аукциона открытия в часовом поясе UTC.
    var openingAuctionEndTime: Date { get }
}

internal struct TradingDayModel: TradingDay {
    let date: Date
    
    let isTradingDay: Bool
    
    let startTime: Date
    
    let endTime: Date
    
    let openingAuctionStartTime: Date
    
    let closingAuctionEndTime: Date
    
    let eveningOpeningAuctionStartTime: Date
    
    let eveningStartTime: Date
    
    let eveningEndTime: Date
    
    let clearingStartTime: Date
    
    let clearingEndTime: Date
    
    let premarketStartTime: Date
    
    let premarketEndTime: Date
    
    let closingAuctionStartTime: Date
    
    let openingAuctionEndTime: Date
}

internal extension TradingDayModel {
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
    func toModel() -> TradingDayModel {
        TradingDayModel(grpcModel: self)
    }
}
