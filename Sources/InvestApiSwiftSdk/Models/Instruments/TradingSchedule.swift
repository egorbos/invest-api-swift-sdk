/// Данные по торговой площадке.
public struct TradingSchedule: Codable {
    /// Наименование торговой площадки.
    public let exchange: String
    
    /// Торговые / неторговые дни.
    public let days: [TradingDay]
}

internal extension TradingSchedule {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_TradingSchedule) {
        self.exchange = grpcModel.exchange
        self.days = grpcModel.days.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradingSchedule {
    func toModel() -> TradingSchedule {
        TradingSchedule(grpcModel: self)
    }
}
