import Foundation

/// Котировка - денежная сумма без указания валюты.
public struct Quotation: Codable {
    /// Целая часть суммы, может быть отрицательным числом.
    public let units: Int64
    
    /// Дробная часть суммы, может быть отрицательным числом.
    public let nano: Int32
    
    private static let nanoFactor: Decimal = 1_000_000_000;
    
    public init(units: Int64, nano: Int32) {
        self.units = units
        self.nano = nano
    }
    
    public init(decimalValue: Decimal) {
        let units = decimalValue.int64Value
        let nano = ((decimalValue - decimalValue.wholePart) * Quotation.nanoFactor).int32Value
        self.init(units: units, nano: nano)
    }
    
    public func toDecimal() -> Decimal {
        return Decimal(units) + Decimal(nano) / Quotation.nanoFactor;
    }
}

extension Quotation: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.units == rhs.units && lhs.nano == rhs.nano
    }
}

extension Quotation: Comparable {
    public static func < (lhs: Quotation, rhs: Quotation) -> Bool {
        lhs.units < rhs.units || lhs.units == rhs.units && lhs.nano < rhs.nano
    }
}

public extension Quotation {
    static func zero() -> Self {
        Quotation(units: 0, nano: 0)
    }
}

extension Quotation: CustomStringConvertible {
    public var description: String {
        return "\(toDecimal())"
    }
}

internal extension Quotation {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Quotation) {
        self.units = grpcModel.units
        self.nano = grpcModel.nano
    }
    
    func forRequest() throws -> Tinkoff_Public_Invest_Api_Contract_V1_Quotation {
        try Tinkoff_Public_Invest_Api_Contract_V1_Quotation(
            jsonUTF8Data: JSONEncoder().encode(self)
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Quotation {
    func toModel() -> Quotation {
        Quotation(grpcModel: self)
    }
}
