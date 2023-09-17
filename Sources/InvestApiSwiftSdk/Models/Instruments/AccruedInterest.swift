import Foundation

/// Информация о начислении купона.
public struct AccruedInterest: Codable {
    /// Дата и время выплаты в часовом поясе UTC.
    let date: Date
    
    /// Величина выплаты.
    let value: Quotation
    
    /// Величина выплаты в процентах от номинала.
    let valuePercent: Quotation
    
    /// Номинал облигации.
    let nominal: Quotation
}

internal extension AccruedInterest {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AccruedInterest) {
        self.date = grpcModel.date.date
        self.value = grpcModel.value.toModel()
        self.valuePercent = grpcModel.valuePercent.toModel()
        self.nominal = grpcModel.nominal.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AccruedInterest {
    func toModel() -> AccruedInterest {
        AccruedInterest(grpcModel: self)
    }
}
