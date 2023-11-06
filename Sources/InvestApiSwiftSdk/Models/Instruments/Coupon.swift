import Foundation

/// Объект содержащий информацию о купоне облигации.
public struct Coupon: Codable {
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Дата выплаты купона.
    public let couponDate: Date
    
    /// Номер купона.
    public let couponNumber: Int64
    
    /// Дата фиксации реестра для выплаты купона (опционально).
    public let fixDate: Date
    
    /// Выплата на одну облигацию.
    public let payOneBond: MoneyValue
    
    /// Тип купона.
    public let couponType: CouponType
    
    /// Начало купонного периода.
    public let couponStartDate: Date
    
    /// Окончание купонного периода.
    public let couponEndDate: Date
    
    /// Купонный период в днях.
    public let couponPeriod: Int32
}

internal extension Coupon {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Coupon) throws {
        self.figi = grpcModel.figi
        self.couponDate = grpcModel.couponDate.date
        self.couponNumber = grpcModel.couponNumber
        self.fixDate = grpcModel.fixDate.date
        self.payOneBond = grpcModel.payOneBond.toModel()
        self.couponType = try .new(rawValue: grpcModel.couponType.rawValue)
        self.couponStartDate = grpcModel.couponStartDate.date
        self.couponEndDate = grpcModel.couponEndDate.date
        self.couponPeriod = grpcModel.couponPeriod
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Coupon {
    func toModel() throws -> Coupon {
        try Coupon(grpcModel: self)
    }
}
