import Foundation

/// Информация о стакане.
public protocol OrderBook {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Уникальный идентификатор инструмента.
    var uid: String { get }
    
    /// Глубина стакана.
    var depth: Int32 { get }
    
    /// Флаг консистентности стакана (false означает, что не все заявки попали в стакан по причинам сетевых задержек или нарушения порядка доставки).
    var isConsistent: Bool { get }
    
    /// Множество пар значений на покупку.
    var bids: [Order] { get }
    
    /// Множество пар значений на продажу.
    var asks: [Order] { get }
    
    /// Верхний лимит цены.
    var limitUp: Quotation { get }
    
    /// Нижний лимит цены. { get }
    var limitDown: Quotation { get }
    
    /// Время формирования стакана на бирже, в часовом поясе UTC.
    var time: Date { get }
}

internal struct OrderBookModel: OrderBook {
    let figi: String
    
    let uid: String
    
    let depth: Int32
    
    let isConsistent: Bool
    
    let bids: [Order]
    
    let asks: [Order]
    
    let limitUp: Quotation
    
    let limitDown: Quotation
    
    let time: Date
}

internal extension OrderBookModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderBook) {
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.depth = grpcModel.depth
        self.isConsistent = grpcModel.isConsistent
        self.bids = grpcModel.bids.map { $0.toModel() }
        self.asks = grpcModel.asks.map { $0.toModel() }
        self.limitUp = grpcModel.limitUp.toModel()
        self.limitDown = grpcModel.limitDown.toModel()
        self.time = grpcModel.time.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderBook {
    func toModel() -> OrderBookModel {
        OrderBookModel(grpcModel: self)
    }
}
