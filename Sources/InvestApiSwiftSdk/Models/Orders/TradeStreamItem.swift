/// Информация об исполнении торгового поручения.
public struct TradeStreamItem {
    /// Идентификатор торгового поручения.
    let orderId: String
    
    /// Идентификатор счёта.
    let accountId: String
    
    /// Figi-идентификатор инструмента.
    let figi: String
    
    /// Uid идентификатор инструмента.
    let uid: String
    
    /// Направление сделки.
    let direction: OrderDirection
    
    /// Сделки.
    let trades: [OrderTrade]
}

internal extension TradeStreamItem {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderTrades) {
        self.orderId = grpcModel.orderID
        self.accountId = grpcModel.accountID
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.direction = OrderDirection(rawValue: grpcModel.direction.rawValue) ?? .unspecified
        self.trades = grpcModel.trades.map { $0.toModel() }
    }
    
    init() {
        self.init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderTrades())
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderTrades {
    func toModel() -> TradeStreamItem {
        TradeStreamItem(grpcModel: self)
    }
}
