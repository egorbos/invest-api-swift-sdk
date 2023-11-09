import Foundation

/// Цена закрытия торговой сессии по инструменту.
public protocol InstrumentClosePrice {
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Цена закрытия торговой сессии.
    var price: Quotation { get }
    
    /// Дата совершения торгов.
    var time: Date { get }
}

internal struct InstrumentClosePriceModel: InstrumentClosePrice {
    let figi: String
    
    let price: Quotation
    
    let time: Date
}

internal extension InstrumentClosePriceModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_InstrumentClosePriceResponse) {
        self.figi = grpcModel.figi
        self.price = grpcModel.price.toModel()
        self.time = grpcModel.time.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InstrumentClosePriceResponse {
    func toModel() -> InstrumentClosePriceModel {
        InstrumentClosePriceModel(grpcModel: self)
    }
}
