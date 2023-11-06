import Foundation

/// Данные по операции.
public struct Operation: Codable {
    /// Идентификатор операции.
    public let id: String
    
    /// Figi идентификатор инструмента.
    public let figi: String
    
    /// Идентификатор родительской операции.
    public let parentOperationId: String
    
    /// Валюта операции.
    public let currency: CurrencyType
    
    /// Сумма операции.
    public let payment: MoneyValue
    
    /// Цена операции за 1 инструмент.
    public let price: MoneyValue
    
    /// Статус операции.
    public let state: OperationState
    
    /// Количество единиц инструмента.
    public let quantity: Int64
    
    /// Неисполненный остаток по сделке.
    public let quantityRest: Int64
    
    /// Тип инструмента.
    public let instrumentType: InstrumentType
    
    /// Дата и время операции в формате часовом поясе UTC.
    public let date: Date
    
    /// Текстовое описание типа операции.
    public let type: String
    
    /// Тип операции.
    public let operationType: OperationType
    
    /// Массив сделок.
    public let trades: [OperationTrade]
}

internal extension Operation {
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
    func toModel() throws -> Operation {
        try Operation(grpcModel: self)
    }
}
