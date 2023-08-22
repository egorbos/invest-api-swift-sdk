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

public extension MoneyValue {
    static func russianRuble(units: Int64, nano: Int32 = 0) -> MoneyValue {
        MoneyValue(currency: "RUB", units: units, nano: nano)
    }
    
    static func usDollar(units: Int64, nano: Int32 = 0) -> MoneyValue {
        MoneyValue(currency: "USD", units: units, nano: nano)
    }
    
    static func euro(units: Int64, nano: Int32 = 0) -> MoneyValue {
        MoneyValue(currency: "EUR", units: units, nano: nano)
    }
}

internal extension MoneyValue {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue) {
        self.currency = grpcModel.currency
        self.units = grpcModel.units
        self.nano = grpcModel.nano
    }
    
    func forRequest() throws -> Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue {
        try Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue(
            jsonUTF8Data: JSONEncoder().encode(self)
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue {
    func toModel() -> MoneyValue {
        MoneyValue(grpcModel: self)
    }
}
