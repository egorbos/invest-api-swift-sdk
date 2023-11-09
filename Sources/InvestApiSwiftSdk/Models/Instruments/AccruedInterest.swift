import Foundation

/// Информация о накопленном купонном доходе.
public protocol AccruedInterest {
    /// Дата и время в часовом поясе UTC.
    var date: Date { get }
    
    /// Величина НКД.
    var value: Quotation { get }
    
    /// Величина НКД в процентах от номинала.
    var valuePercent: Quotation { get }
    
    /// Номинал облигации.
    var nominal: Quotation { get }
}

internal struct AccruedInterestModel: AccruedInterest {
    let date: Date
    
    let value: Quotation
    
    let valuePercent: Quotation
    
    let nominal: Quotation
}

internal extension AccruedInterestModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_AccruedInterest) {
        self.date = grpcModel.date.date
        self.value = grpcModel.value.toModel()
        self.valuePercent = grpcModel.valuePercent.toModel()
        self.nominal = grpcModel.nominal.toModel()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AccruedInterest {
    func toModel() -> AccruedInterestModel {
        AccruedInterestModel(grpcModel: self)
    }
}
