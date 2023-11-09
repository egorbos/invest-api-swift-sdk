import Foundation

/// Информация о торговом статусе.
public protocol TradingStatus {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Уникальный идентификатор инструмента.
    var uid: String { get }
    
    /// Статус торговли инструментом.
    var tradingStatus: SecurityTradingStatus { get }
    
    /// Признак доступности выставления лимитной заявки по инструменту.
    var limitOrderAvailableFlag: Bool { get }
    
    /// Признак доступности выставления рыночной заявки по инструменту.
    var marketOrderAvailableFlag: Bool { get }
    
    /// Время изменения торгового статуса в часовом поясе UTC.
    var time: Date { get }
}

internal struct TradingStatusModel: TradingStatus {
    let figi: String
    
    let uid: String
    
    let tradingStatus: SecurityTradingStatus
    
    let limitOrderAvailableFlag: Bool
    
    let marketOrderAvailableFlag: Bool
    
    let time: Date
}

internal extension TradingStatusModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_TradingStatus) {
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.tradingStatus = SecurityTradingStatus(rawValue: grpcModel.tradingStatus.rawValue) ?? .unspecified
        self.limitOrderAvailableFlag = grpcModel.limitOrderAvailableFlag
        self.marketOrderAvailableFlag = grpcModel.marketOrderAvailableFlag
        self.time = grpcModel.time.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradingStatus {
    func toModel() -> TradingStatusModel {
        TradingStatusModel(grpcModel: self)
    }
}

