/// Данные по торговой площадке.
public protocol TradingSchedule {
    /// Наименование торговой площадки.
    var exchange: String { get }
    
    /// Торговые / неторговые дни.
    var days: [TradingDay] { get }
}

internal struct TradingScheduleModel: TradingSchedule {
    var exchange: String
    
    var days: [TradingDay]
}

internal extension TradingScheduleModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_TradingSchedule) {
        self.exchange = grpcModel.exchange
        self.days = grpcModel.days.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradingSchedule {
    func toModel() -> TradingScheduleModel {
        TradingScheduleModel(grpcModel: self)
    }
}
