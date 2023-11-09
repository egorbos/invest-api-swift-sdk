import Foundation

/// Информация о стакане.
public protocol OrderBookInfo {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Глубина стакана.
    var depth: Int32 { get }
    
    /// Множество пар значений на покупку.
    var bids: [Order] { get }
    
    /// Множество пар значений на продажу.
    var asks: [Order] { get }
    
    /// Цена последней сделки.
    var lastPrice: Quotation { get }
    
    /// Цена закрытия.
    var closePrice: Quotation { get }
    
    /// Верхний лимит цены.
    var limitUp: Quotation { get }
    
    /// Нижний лимит цены.
    var limitDown: Quotation { get }
    
    /// Время получения цены последней сделки.
    var lastPriceTime: Date { get }
    
    /// Время получения цены закрытия.
    var closePriceTime: Date { get }
    
    /// Время формирования стакана на бирже.
    var time: Date { get }
}

internal struct OrderBookInfoModel: OrderBookInfo {
    let figi: String
    
    let depth: Int32
    
    let bids: [Order]
    
    let asks: [Order]
    
    let lastPrice: Quotation
    
    let closePrice: Quotation
    
    let limitUp: Quotation
    
    let limitDown: Quotation
    
    let lastPriceTime: Date
    
    let closePriceTime: Date
    
    let time: Date
}

internal extension OrderBookInfoModel {
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
    func toModel() -> OrderBookInfoModel {
        OrderBookInfoModel(grpcModel: self)
    }
}
