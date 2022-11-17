import Foundation

/// Информация о стакане.
public struct OrderBookInfo: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Глубина стакана.
    let depth: Int32
    
    /// Множество пар значений на покупку.
    let bids: [Order]
    
    /// Множество пар значений на продажу.
    let asks: [Order]
    
    /// Цена последней сделки
    let lastPrice: Quotation
    
    /// Цена закрытия
    let closePrice: Quotation
    
    /// Верхний лимит цены
    let limitUp: Quotation
    
    /// Нижний лимит цены
    let limitDown: Quotation
    
    /// Время получения цены последней сделки.
    let lastPriceTime: Date
    
    /// Время получения цены закрытия.
    let closePriceTime: Date
    
    /// Время формирования стакана на бирже.
    let time: Date
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
