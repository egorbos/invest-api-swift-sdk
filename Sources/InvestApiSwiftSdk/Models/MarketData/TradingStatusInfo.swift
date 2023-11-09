/// Информация о торговом статусе.
public protocol TradingStatusInfo {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Статус торговли инструментом.
    var tradingStatus: SecurityTradingStatus { get }
    
    /// Признак доступности выставления лимитной заявки по инструменту.
    var limitOrderAvailableFlag: Bool { get }
    
    /// Признак доступности выставления рыночной заявки по инструменту.
    var marketOrderAvailableFlag: Bool { get }
    
    /// Признак доступности торгов через API.
    var apiTradeAvailableFlag: Bool { get }
}

internal struct TradingStatusInfoModel: TradingStatusInfo {
    let figi: String
    
    let tradingStatus: SecurityTradingStatus
    
    let limitOrderAvailableFlag: Bool
    
    let marketOrderAvailableFlag: Bool
    
    let apiTradeAvailableFlag: Bool
}

internal extension TradingStatusInfoModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusResponse) throws {
        self.figi = grpcModel.figi
        self.tradingStatus = try .new(rawValue: grpcModel.tradingStatus.rawValue)
        self.limitOrderAvailableFlag = grpcModel.limitOrderAvailableFlag
        self.marketOrderAvailableFlag = grpcModel.marketOrderAvailableFlag
        self.apiTradeAvailableFlag = grpcModel.apiTradeAvailableFlag
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusResponse {
    func toModel() throws -> TradingStatusInfoModel {
        try TradingStatusInfoModel(grpcModel: self)
    }
}

