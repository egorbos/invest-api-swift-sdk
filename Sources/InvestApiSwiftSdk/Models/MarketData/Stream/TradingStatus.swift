import Foundation

/// Информация о торговом статусе.
public struct TradingStatus: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Уникальный идентификатор инструмента.
    let uid: String
    
    /// Статус торговли инструментом.
    let tradingStatus: SecurityTradingStatus
    
    /// Признак доступности выставления лимитной заявки по инструменту.
    let limitOrderAvailableFlag: Bool
    
    /// Признак доступности выставления рыночной заявки по инструменту.
    let marketOrderAvailableFlag: Bool
    
    /// Время изменения торгового статуса в часовом поясе UTC.
    let time: Date
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

