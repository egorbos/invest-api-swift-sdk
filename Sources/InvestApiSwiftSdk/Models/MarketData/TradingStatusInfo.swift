/// Информация о торговом статусе.
public struct TradingStatusInfo: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Статус торговли инструментом.
    let tradingStatus: SecurityTradingStatus
    
    /// Признак доступности выставления лимитной заявки по инструменту.
    let limitOrderAvailableFlag: Bool
    
    /// Признак доступности выставления рыночной заявки по инструменту.
    let marketOrderAvailableFlag: Bool
    
    /// Признак доступности торгов через API.
    let apiTradeAvailableFlag: Bool
}

internal extension TradingStatusInfo {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusResponse) throws {
        self.figi = grpcModel.figi
        self.tradingStatus = try SecurityTradingStatus(rawValue: grpcModel.tradingStatus.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        self.limitOrderAvailableFlag = grpcModel.limitOrderAvailableFlag
        self.marketOrderAvailableFlag = grpcModel.marketOrderAvailableFlag
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusResponse {
    func toModel() throws -> TradingStatusInfo {
        try TradingStatusInfo(grpcModel: self)
    }
}

