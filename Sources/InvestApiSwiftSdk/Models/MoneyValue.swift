import Foundation

/// Денежная сумма в определенной валюте.
public struct MoneyValue: Codable {
    /// Строковый ISO-код валюты.
    public let currency: CurrencyType
    
    /// Целая часть суммы, может быть отрицательным числом.
    public let units: Int64
    
    /// Дробная часть суммы, может быть отрицательным числом.
    public let nano: Int32
}

public extension MoneyValue {
    private static let nanoFactor: Decimal = 1_000_000_000;
    
    func toDecimal() -> Decimal {
        return Decimal(units) + Decimal(nano) / MoneyValue.nanoFactor;
    }
}

extension MoneyValue: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.currency.rawValue == rhs.currency.rawValue && lhs.units == rhs.units && lhs.nano == rhs.nano
    }
}

public extension MoneyValue {
    static func zero(currency: CurrencyType) -> Self {
        MoneyValue(currency: currency, units: 0, nano: 0)
    }
}

extension MoneyValue: CustomStringConvertible {
    public var description: String {
        return "\(toDecimal()) \(currency.rawValue.uppercased())"
    }
}

public extension MoneyValue {
    /// Российский рубль.
    static func russianRuble(units: Int64, nano: Int32 = 0) -> Self {
        MoneyValue(currency: .russianRuble, units: units, nano: nano)
    }
    
    /// Доллар США.
    static func usDollar(units: Int64, nano: Int32 = 0) -> Self {
        MoneyValue(currency: .usDollar, units: units, nano: nano)
    }
    
    /// Евро.
    static func euro(units: Int64, nano: Int32 = 0) -> Self {
        MoneyValue(currency: .euro, units: units, nano: nano)
    }
    
    /// Китайский юань.
    static func chineseYuan(units: Int64, nano: Int32 = 0) -> Self {
        MoneyValue(currency: .chineseYuan, units: units, nano: nano)
    }
    
    /// Гонконгский доллар.
    static func hkDollar(units: Int64, nano: Int32 = 0) -> Self {
        MoneyValue(currency: .hkDollar, units: units, nano: nano)
    }
    
    static func null() -> Self {
        MoneyValue(currency: .unspecified, units: 0, nano: 0)
    }
}

internal extension MoneyValue {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue) {
        self.currency = CurrencyType(rawValue: grpcModel.currency) ?? .unspecified
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
