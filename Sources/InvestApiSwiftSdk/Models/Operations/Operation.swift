import Foundation

/// Данные по операции.
public protocol Operation {
    /// Идентификатор операции.
    var id: String { get }
    
    /// Figi идентификатор инструмента.
    var figi: String { get }
    
    /// Идентификатор родительской операции.
    var parentOperationId: String { get }
    
    /// Валюта операции.
    var currency: CurrencyType { get }
    
    /// Сумма операции.
    var payment: MoneyValue { get }
    
    /// Цена операции за 1 инструмент.
    var price: MoneyValue { get }
    
    /// Статус операции.
    var state: OperationState { get }
    
    /// Количество единиц инструмента.
    var quantity: Int64 { get }
    
    /// Неисполненный остаток по сделке.
    var quantityRest: Int64 { get }
    
    /// Тип инструмента.
    var instrumentType: InstrumentType { get }
    
    /// Дата и время операции в формате часовом поясе UTC.
    var date: Date { get }
    
    /// Текстовое описание типа операции.
    var type: String { get }
    
    /// Тип операции.
    var operationType: OperationType { get }
    
    /// Массив сделок.
    var trades: [OperationTrade] { get }
}

internal struct OperationModel: Operation {
    let id: String
    
    let figi: String
    
    let parentOperationId: String
    
    let currency: CurrencyType
    
    let payment: MoneyValue
    
    let price: MoneyValue
    
    let state: OperationState
    
    let quantity: Int64
    
    let quantityRest: Int64
    
    let instrumentType: InstrumentType
    
    let date: Date
    
    let type: String
    
    let operationType: OperationType
    
    let trades: [OperationTrade]
}

internal extension OperationModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Operation) throws {
        self.id = grpcModel.id
        self.figi = grpcModel.figi
        self.parentOperationId = grpcModel.parentOperationID
        self.currency = try .new(rawValue: grpcModel.currency)
        self.payment = grpcModel.payment.toModel()
        self.price = grpcModel.price.toModel()
        self.state = try .new(rawValue: grpcModel.state.rawValue)
        self.quantity = grpcModel.quantity
        self.quantityRest = grpcModel.quantityRest
        self.instrumentType = try .new(rawValue: grpcModel.instrumentType)
        self.date = grpcModel.date.date
        self.type = grpcModel.type
        self.operationType = try .new(rawValue: grpcModel.operationType.rawValue)
        self.trades = grpcModel.trades.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Operation {
    func toModel() throws -> OperationModel {
        try OperationModel(grpcModel: self)
    }
}
