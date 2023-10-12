import Foundation

/// Информация о стакане.
public struct OrderBook: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Уникальный идентификатор инструмента.
    let uid: String
    
    /// Глубина стакана.
    let depth: Int32
    
    /// Флаг консистентности стакана (false означает, что не все заявки попали в стакан по причинам сетевых задержек или нарушения порядка доставки).
    let isConsistent: Bool
    
    /// Множество пар значений на покупку.
    let bids: [Order]
    
    /// Множество пар значений на продажу.
    let asks: [Order]
    
    /// Верхний лимит цены.
    let limitUp: Quotation
    
    /// Нижний лимит цены.
    let limitDown: Quotation
    
    /// Время формирования стакана на бирже, в часовом поясе UTC.
    let time: Date
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
