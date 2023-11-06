import Foundation

/// Информация о стакане.
public struct OrderBook: Codable {
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Уникальный идентификатор инструмента.
    public let uid: String
    
    /// Глубина стакана.
    public let depth: Int32
    
    /// Флаг консистентности стакана (false означает, что не все заявки попали в стакан по причинам сетевых задержек или нарушения порядка доставки).
    public let isConsistent: Bool
    
    /// Множество пар значений на покупку.
    public let bids: [Order]
    
    /// Множество пар значений на продажу.
    public let asks: [Order]
    
    /// Верхний лимит цены.
    public let limitUp: Quotation
    
    /// Нижний лимит цены.
    public let limitDown: Quotation
    
    /// Время формирования стакана на бирже, в часовом поясе UTC.
    public let time: Date
}

internal extension OrderBook {
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
    func toModel() -> OrderBook {
        OrderBook(grpcModel: self)
    }
}
