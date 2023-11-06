import Foundation

/// Цена закрытия торговой сессии по инструменту.
public struct InstrumentClosePrice: Codable {
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Цена закрытия торговой сессии.
    public let price: Quotation
    
    /// Дата совершения торгов.
    public let time: Date
}

internal extension InstrumentClosePrice {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_InstrumentClosePriceResponse) {
        self.figi = grpcModel.figi
        self.price = grpcModel.price.toModel()
        self.time = grpcModel.time.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InstrumentClosePriceResponse {
    func toModel() -> InstrumentClosePrice {
        InstrumentClosePrice(grpcModel: self)
    }
}
