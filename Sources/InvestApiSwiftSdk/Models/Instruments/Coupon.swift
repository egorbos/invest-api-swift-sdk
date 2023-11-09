import Foundation

/// Объект содержащий информацию о купоне облигации.
public protocol Coupon {
    /// Figi-идентификатор инструмента.
    var figi: String { get }
    
    /// Дата выплаты купона.
    var couponDate: Date { get }
    
    /// Номер купона.
    var couponNumber: Int64 { get }
    
    /// Дата фиксации реестра для выплаты купона (опционально).
    var fixDate: Date { get }
    
    /// Выплата на одну облигацию.
    var payOneBond: MoneyValue { get }
    
    /// Тип купона.
    var couponType: CouponType { get }
    
    /// Начало купонного периода.
    var couponStartDate: Date { get }
    
    /// Окончание купонного периода.
    var couponEndDate: Date { get }
    
    /// Купонный период в днях.
    var couponPeriod: Int32 { get }
}

internal struct CouponModel: Coupon {
    let figi: String
    
    let couponDate: Date
    
    let couponNumber: Int64
    
    let fixDate: Date
    
    let payOneBond: MoneyValue
    
    let couponType: CouponType
    
    let couponStartDate: Date
    
    let couponEndDate: Date
    
    let couponPeriod: Int32
}

internal extension CouponModel {
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
    func toModel() throws -> CouponModel {
        try CouponModel(grpcModel: self)
    }
}
