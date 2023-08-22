import Foundation

/// Данные об операции.
public struct OperationItem: Codable {
    /// Курсор.
    let cursor: String
    
    /// Номер счета клиента.
    let accountId: String
    
    /// Идентификатор операции (может меняться с течением времени).
    let id: String
    
    /// Идентификатор родительской операции (может измениться, если изменился id родительской операции).
    let parentOperationId: String
    
    /// Массив сделок.
    let trades: [OperationItemTrade]
    
    /// Название операции.
    let name: String
    
    /// Дата поручения.
    let date: Date
    
    /// Тип операции.
    let operationType: OperationType
    
    /// Описание операции.
    let description: String
    
    /// Статус поручения.
    let state: OperationState
    
    /// Figi-идентификатор инструмента.
    let figi: String
    
    /// Тип инструмента.
    let instrumentType: String // TODO: InstrumentType ???
    
    /// Сумма операции.
    let payment: MoneyValue
    
    /// Цена за 1 инструмент.
    let price: MoneyValue
    
    /// Комиссия.
    let commission: MoneyValue
    
    /// Доходность.
    let yield: MoneyValue
    
    /// Относительная доходность.
    let yieldRelative: Quotation
    
    /// Накопленный купонный доход.
    let accumCouponValue: MoneyValue
    
    /// Количество единиц инструмента.
    let quantity: Int64
    
    /// Неисполненный остаток по сделке.
    let quantityRest: Int64
    
    /// Исполненный остаток.
    let quantityDone: Int64
    
    /// Дата снятия заявки.
    let cancelDate: Date
    
    /// Причина отмены операции.
    let cancelReason: String
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
        self.operationType = try OperationType(rawValue: grpcModel.type.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        self.description = grpcModel.description_p
        self.state = try OperationState(rawValue: grpcModel.state.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        self.figi = grpcModel.figi
        self.instrumentType = grpcModel.instrumentType
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
