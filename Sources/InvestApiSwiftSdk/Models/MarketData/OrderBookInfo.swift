import Foundation

/// Информация о стакане.
public struct OrderBookInfo: Codable {
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Глубина стакана.
    public let depth: Int32
    
    /// Множество пар значений на покупку.
    public let bids: [Order]
    
    /// Множество пар значений на продажу.
    public let asks: [Order]
    
    /// Цена последней сделки.
    public let lastPrice: Quotation
    
    /// Цена закрытия.
    public let closePrice: Quotation
    
    /// Верхний лимит цены.
    public let limitUp: Quotation
    
    /// Нижний лимит цены.
    public let limitDown: Quotation
    
    /// Время получения цены последней сделки.
    public let lastPriceTime: Date
    
    /// Время получения цены закрытия.
    public let closePriceTime: Date
    
    /// Время формирования стакана на бирже.
    public let time: Date
}

internal extension OrderBookInfo {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_GetOrderBookResponse) {
        self.figi = grpcModel.figi
        self.depth = grpcModel.depth
        self.bids = grpcModel.bids.map { $0.toModel() }
        self.asks = grpcModel.asks.map { $0.toModel() }
        self.lastPrice = grpcModel.lastPrice.toModel()
        self.closePrice = grpcModel.closePrice.toModel()
        self.limitUp = grpcModel.limitUp.toModel()
        self.limitDown = grpcModel.limitDown.toModel()
        self.lastPriceTime = grpcModel.lastPriceTs.date
        self.closePriceTime = grpcModel.closePriceTs.date
        self.time = grpcModel.orderbookTs.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOrderBookResponse {
    func toModel() -> OrderBookInfo {
        OrderBookInfo(grpcModel: self)
    }
}
