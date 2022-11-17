import Foundation

/// Информация о цене.
public struct LastPrice: Codable {
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Последняя цена (1 единица).
    let price: Quotation
    
    /// Время получения последней цены в часовом поясе UTC по времени биржи.
    let time: Date
    
    /// Uid идентификатор инструмента.
    let uid: String
}

internal extension LastPrice {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_LastPrice) {
        self.figi = grpcModel.figi
        self.price = grpcModel.price.toModel()
        self.time = grpcModel.time.date
        self.uid = grpcModel.instrumentUid
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_LastPrice {
    func toModel() -> LastPrice {
        LastPrice(grpcModel: self)
    }
}
