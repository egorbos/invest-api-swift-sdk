import Foundation

/// Информация об исполнении торгового поручения.
public struct TradeStreamItem: Codable {
    /// Идентификатор торгового поручения.
    public let orderId: String
    
    /// Идентификатор счёта.
    public let accountId: String
    
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Uid идентификатор инструмента.
    public let uid: String
    
    /// Направление сделки.
    public let direction: OrderDirection
    
    /// Сделки.
    public let trades: [OrderTrade]
    
    /// Дата и время создания сообщения в часовом поясе UTC.
    public let createdAt: Date
}

internal extension TradeStreamItem {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderTrades) {
        self.orderId = grpcModel.orderID
        self.accountId = grpcModel.accountID
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.direction = OrderDirection(rawValue: grpcModel.direction.rawValue) ?? .unspecified
        self.trades = grpcModel.trades.map { $0.toModel() }
        self.createdAt = grpcModel.createdAt.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderTrades {
    func toModel() -> TradeStreamItem {
        TradeStreamItem(grpcModel: self)
    }
}