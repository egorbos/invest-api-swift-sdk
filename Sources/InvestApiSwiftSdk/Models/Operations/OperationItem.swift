import Foundation

/// Данные об операции.
public protocol OperationItem {
    /// Курсор.
    var cursor: String { get }
    
    /// Номер счета клиента.
    var accountId: String { get }
    
    /// Идентификатор операции (может меняться с течением времени).
    var id: String { get }
    
    /// Идентификатор родительской операции (может измениться, если изменился id родительской операции).
    var parentOperationId: String { get }
    
    /// Массив сделок.
    var trades: [OperationItemTrade] { get }
    
    /// Название операции.
    var name: String { get }
    
    /// Дата поручения.
    var date: Date { get }
    
    /// Тип операции.
    var operationType: OperationType { get }
    
    /// Описание операции.
    var description: String { get }
    
    /// Статус поручения.
    var state: OperationState { get }
    
    /// Figi-идентификатор инструмента.
    var figi: String { get }
    
    /// Тип инструмента.
    var instrumentType: InstrumentType { get }
    
    /// Сумма операции.
    var payment: MoneyValue { get }
    
    /// Цена за 1 инструмент.
    var price: MoneyValue { get }
    
    /// Комиссия.
    var commission: MoneyValue { get }
    
    /// Доходность.
    var yield: MoneyValue { get }
    
    /// Относительная доходность.
    var yieldRelative: Quotation { get }
    
    /// Накопленный купонный доход.
    var accumCouponValue: MoneyValue { get }
    
    /// Количество единиц инструмента.
    var quantity: Int64 { get }
    
    /// Неисполненный остаток по сделке.
    var quantityRest: Int64 { get }
    
    /// Исполненный остаток.
    var quantityDone: Int64 { get }
    
    /// Дата снятия заявки.
    var cancelDate: Date { get }
    
    /// Причина отмены операции.
    var cancelReason: String { get }
}

internal struct OperationItemModel: OperationItem {
    let cursor: String
    
    let accountId: String
    
    let id: String
    
    let parentOperationId: String
    
    let trades: [OperationItemTrade]
    
    let name: String
    
    let date: Date
    
    let operationType: OperationType
    
    let description: String
    
    let state: OperationState
    
    let figi: String
    
    let instrumentType: InstrumentType
    
    let payment: MoneyValue
    
    let price: MoneyValue
    
    let commission: MoneyValue
    
    let yield: MoneyValue
    
    let yieldRelative: Quotation
    
    let accumCouponValue: MoneyValue
    
    let quantity: Int64
    
    let quantityRest: Int64
    
    let quantityDone: Int64
    
    let cancelDate: Date
    
    let cancelReason: String
}

internal extension OperationItemModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OperationItem) throws {
        self.cursor = grpcModel.cursor
        self.accountId = grpcModel.brokerAccountID
        self.id = grpcModel.id
        self.parentOperationId = grpcModel.parentOperationID
        self.trades = grpcModel.tradesInfo.trades.map { $0.toModel() }
        self.name = grpcModel.name
        self.date = grpcModel.date.date
        self.operationType = try .new(rawValue: grpcModel.type.rawValue)
        self.description = grpcModel.description_p
        self.state = try .new(rawValue: grpcModel.state.rawValue)
        self.figi = grpcModel.figi
        self.instrumentType = try .new(rawValue:  grpcModel.instrumentType)
        self.payment = grpcModel.payment.toModel()
        self.price = grpcModel.price.toModel()
        self.commission = grpcModel.commission.toModel()
        self.yield = grpcModel.yield.toModel()
        self.yieldRelative = grpcModel.yieldRelative.toModel()
        self.accumCouponValue = grpcModel.accruedInt.toModel()
        self.quantity = grpcModel.quantity
        self.quantityRest = grpcModel.quantityRest
        self.quantityDone = grpcModel.quantityDone
        self.cancelDate = grpcModel.cancelDateTime.date
        self.cancelReason = grpcModel.cancelReason
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OperationItem {
    func toModel() throws -> OperationItemModel {
        try OperationItemModel(grpcModel: self)
    }
}
