import Foundation

/// Информация об исполнении торгового поручения.
public protocol TradeStreamItem {
    /// Идентификатор торгового поручения.
    var orderId: String { get }
    
    /// Идентификатор счёта.
    var accountId: String { get }
    
    /// Figi-идентификатор инструмента.
    var figi: String { get }
    
    /// Uid идентификатор инструмента.
    var uid: String { get }
    
    /// Направление сделки.
    var direction: OrderDirection { get }
    
    /// Сделки.
    var trades: [OrderTrade] { get }
    
    /// Дата и время создания сообщения в часовом поясе UTC.
    var createdAt: Date { get }
}

internal struct TradeStreamItemModel: TradeStreamItem {
    let orderId: String
    
    let accountId: String
    
    let figi: String
    
    let uid: String
    
    let direction: OrderDirection
    
    let trades: [OrderTrade]
    
    let createdAt: Date
}

internal extension TradeStreamItemModel {
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
    func toModel() -> TradeStreamItemModel {
        TradeStreamItemModel(grpcModel: self)
    }
}
