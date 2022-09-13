import Foundation

/// Котировка - денежная сумма без указания валюты.
public struct Quotation: Codable {
    /// Целая часть суммы, может быть отрицательным числом.
    let units: Int64
    
    /// Дробная часть суммы, может быть отрицательным числом.
    let nano: Int32
}

internal extension Quotation {
    init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Quotation) {
        self.units = grpcModel.units
        self.nano = grpcModel.nano
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Quotation {
    func toModel() -> Quotation {
        Quotation(grpcModel: self)
    }
}
