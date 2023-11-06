import Foundation

/// Информация о торговом статусе.
public struct TradingStatus: Codable {
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Уникальный идентификатор инструмента.
    public let uid: String
    
    /// Статус торговли инструментом.
    public let tradingStatus: SecurityTradingStatus
    
    /// Признак доступности выставления лимитной заявки по инструменту.
    public let limitOrderAvailableFlag: Bool
    
    /// Признак доступности выставления рыночной заявки по инструменту.
    public let marketOrderAvailableFlag: Bool
    
    /// Время изменения торгового статуса в часовом поясе UTC.
    public let time: Date
}

internal extension TradingStatus {
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
    func toModel() -> TradingStatus {
        TradingStatus(grpcModel: self)
    }
}

