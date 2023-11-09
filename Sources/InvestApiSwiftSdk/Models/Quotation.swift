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
        self.init(units: decimalValue.units, nano: decimalValue.nano)
    }
}

public extension Quotation {
    func toDecimal() -> Decimal {
        return Decimal(units) + Decimal(nano) / Quotation.nanoFactor;
    }
}

public extension Quotation {
    /// Направление округления.
    enum RoundingMode {
        case up
        case down
    }
    
    fileprivate enum Operation {
        case increase
        case decrease
    }
    
    /// Увеличивает данную сумму на указанный процент.
    ///
    /// - Parameter percentage: Величина процента, на которую необходимо увеличить данную сумму.
    ///
    /// - Returns: Сумма увеличенная на указанный процент `Quotation`.
    func increaseBy(percentage: Decimal) -> Self {
        increaseBy(percentage: percentage, priceStep: 0)
    }
    
    /// Увеличивает данную сумму на указанный процент.
    ///
    /// - Parameters:
    ///     - percentage: Величина процента, на которую необходимо увеличить данную сумму.
    ///     - priceStep: Минимальный шаг цены, с учетом которого необходимо произвести округление результата.
    ///     - rounding: Направление округления (по умолчанию .down).
    ///
    /// - Returns: Сумма увеличенная на указанный процент `Quotation`.
    func increaseBy(percentage: Decimal, priceStep: Quotation, rounding: RoundingMode = .down) -> Self {
        return increaseBy(percentage: percentage, priceStep: priceStep.toDecimal(), rounding: rounding)
    }
    
    /// Увеличивает данную сумму на указанный процент.
    ///
    /// - Parameters:
    ///     - percentage: Величина процента, на которую необходимо увеличить данную сумму.
    ///     - priceStep: Минимальный шаг цены, с учетом которого необходимо произвести округление результата.
    ///     - rounding: Направление округления (по умолчанию .down).
    ///
    /// - Returns: Сумма увеличенная на указанный процент `Quotation`.
    func increaseBy(percentage: Decimal, priceStep: Decimal, rounding: RoundingMode = .down) -> Self {
        let decimalValue = applyOperation(operation: .increase, percentage: percentage)
        if priceStep == 0 {
            return Quotation(decimalValue: decimalValue)
        }
        return roundValue(decimalValue: decimalValue, priceStep: priceStep, rounding: rounding)
    }
    
    /// Уменьшает данную сумму на указанный процент.
    ///
    /// - Parameter percentage: Величина процента, на которую необходимо уменьшить данную сумму.
    ///
    /// - Returns: Сумма уменьшенная на указанный процент `Quotation`.
    func decreaseBy(percentage: Decimal) -> Self {
        decreaseBy(percentage: percentage, priceStep: 0)
    }
    
    /// Уменьшает данную сумму на указанный процент.
    ///
    /// - Parameters:
    ///     - percentage: Величина процента, на которую необходимо уменьшить данную сумму.
    ///     - priceStep: Минимальный шаг цены, с учетом которого необходимо произвести округление результата.
    ///     - rounding: Направление округления (по умолчанию .down).
    ///
    /// - Returns: Сумма уменьшенная на указанный процент `Quotation`.
    func decreaseBy(percentage: Decimal, priceStep: Quotation, rounding: RoundingMode = .down) -> Self {
        return decreaseBy(percentage: percentage, priceStep: priceStep.toDecimal(), rounding: rounding)
    }
    
    /// Уменьшает данную сумму на указанный процент.
    ///
    /// - Parameters:
    ///     - percentage: Величина процента, на которую необходимо уменьшить данную сумму.
    ///     - priceStep: Минимальный шаг цены, с учетом которого необходимо произвести округление результата.
    ///     - rounding: Направление округления (по умолчанию .down).
    ///
    /// - Returns: Сумма уменьшенная на указанный процент `Quotation`.
    func decreaseBy(percentage: Decimal, priceStep: Decimal, rounding: RoundingMode = .down) -> Self {
        let decimalValue = applyOperation(operation: .decrease, percentage: percentage)
        if priceStep == 0 {
            return Quotation(decimalValue: decimalValue)
        }
        return roundValue(decimalValue: decimalValue, priceStep: priceStep, rounding: rounding)
    }
    
    private func applyOperation(operation: Quotation.Operation, percentage: Decimal) -> Decimal {
        let decimalValue = self.toDecimal()
        let secondValue = (decimalValue / 100 * percentage)
        return operation == .increase ? decimalValue + secondValue : decimalValue - secondValue
    }
    
    private func roundValue(decimalValue: Decimal, priceStep: Decimal, rounding: RoundingMode) -> Quotation {
        let units = decimalValue.units
        let nano = decimalValue.nano
        let newNano = rounding == .down ? nano - nano % priceStep.nano : nano + (priceStep.nano - nano % priceStep.nano)
        return Quotation(
            units: newNano < 0 ? units - 1 : newNano < 1000000000 ? units : units + 1,
            nano: newNano < 0 ? 1000000000 + newNano : newNano < 1000000000 ? newNano : newNano - 1000000000
        )
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
