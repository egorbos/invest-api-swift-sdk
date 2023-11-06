import Foundation

/// Информация о накопленном купонном доходе.
public struct AccruedInterest: Codable {
    /// Дата и время в часовом поясе UTC.
    public let date: Date
    
    /// Величина НКД.
    public let value: Quotation
    
    /// Величина НКД в процентах от номинала.
    public let valuePercent: Quotation
    
    /// Номинал облигации.
    public let nominal: Quotation
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
