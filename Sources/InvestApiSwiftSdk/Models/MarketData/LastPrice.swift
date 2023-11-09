import Foundation

/// Информация о цене.
public protocol LastPrice {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Uid идентификатор инструмента.
    var uid: String { get }
    
    /// Последняя цена (1 единица).
    var price: Quotation { get }
    
    /// Время получения последней цены в часовом поясе UTC по времени биржи.
    var time: Date { get }
}

internal struct LastPriceModel: LastPrice {
    let figi: String
    
    let uid: String
    
    let price: Quotation
    
    let time: Date
}

internal extension LastPriceModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_LastPrice) {
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.price = grpcModel.price.toModel()
        self.time = grpcModel.time.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_LastPrice {
    func toModel() -> LastPriceModel {
        LastPriceModel(grpcModel: self)
    }
}
