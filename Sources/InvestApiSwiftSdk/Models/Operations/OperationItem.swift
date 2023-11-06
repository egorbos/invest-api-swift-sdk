import Foundation

/// Данные об операции.
public struct OperationItem: Codable {
    /// Курсор.
    public let cursor: String
    
    /// Номер счета клиента.
    public let accountId: String
    
    /// Идентификатор операции (может меняться с течением времени).
    public let id: String
    
    /// Идентификатор родительской операции (может измениться, если изменился id родительской операции).
    public let parentOperationId: String
    
    /// Массив сделок.
    public let trades: [OperationItemTrade]
    
    /// Название операции.
    public let name: String
    
    /// Дата поручения.
    public let date: Date
    
    /// Тип операции.
    public let operationType: OperationType
    
    /// Описание операции.
    public let description: String
    
    /// Статус поручения.
    public let state: OperationState
    
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Тип инструмента.
    public let instrumentType: InstrumentType
    
    /// Сумма операции.
    public let payment: MoneyValue
    
    /// Цена за 1 инструмент.
    public let price: MoneyValue
    
    /// Комиссия.
    public let commission: MoneyValue
    
    /// Доходность.
    public let yield: MoneyValue
    
    /// Относительная доходность.
    public let yieldRelative: Quotation
    
    /// Накопленный купонный доход.
    public let accumCouponValue: MoneyValue
    
    /// Количество единиц инструмента.
    public let quantity: Int64
    
    /// Неисполненный остаток по сделке.
    public let quantityRest: Int64
    
    /// Исполненный остаток.
    public let quantityDone: Int64
    
    /// Дата снятия заявки.
    public let cancelDate: Date
    
    /// Причина отмены операции.
    public let cancelReason: String
}

internal extension OperationItem {
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
    func toModel() throws -> OperationItem {
        try OperationItem(grpcModel: self)
    }
}
