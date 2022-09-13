import Foundation

/// Денежная сумма в определенной валюте.
public struct MoneyValue: Codable {
    /// Строковый ISO-код валюты.
    let currency: String
    
    /// Целая часть суммы, может быть отрицательным числом.
    let units: Int64
    
    /// Дробная часть суммы, может быть отрицательным числом.
    let nano: Int32
}

internal extension MoneyValue {
    init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue) {
        self.currency = grpcModel.currency
        self.units = grpcModel.units
        self.nano = grpcModel.nano
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue {
    func toModel() -> MoneyValue {
        MoneyValue(grpcModel: self)
    }
}
