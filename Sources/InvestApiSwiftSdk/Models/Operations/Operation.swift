import Foundation

/// Данные по операции.
public struct Operation: Codable {
    /// Идентификатор операции.
    let id: String
    
    /// Figi идентификатор инструмента.
    let figi: String
    
    /// Идентификатор родительской операции.
    let parentOperationId: String
    
    /// Валюта операции.
    let currency: String // MARK: Возможно изменить на CurrencyType?
    
    /// Сумма операции.
    let payment: MoneyValue
    
    /// Цена операции за 1 инструмент.
    let price: MoneyValue
    
    /// Статус операции.
    let state: OperationState
    
    /// Количество единиц инструмента.
    let quantity: Int64
    
    /// Неисполненный остаток по сделке.
    let quantityRest: Int64
    
    /// Тип инструмента.
    let instrumentType: InstrumentType
    
    /// Дата и время операции в формате часовом поясе UTC.
    let date: Date
    
    /// Текстовое описание типа операции.
    let type: String
    
    /// Тип операции.
    let operationType: OperationType
    
    /// Массив сделок.
    let trades: [OperationTrade]
}

internal extension Operation {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_Operation) throws {
        self.id = grpcModel.id
        self.figi = grpcModel.figi
        self.parentOperationId = grpcModel.parentOperationID
        self.currency = grpcModel.currency
        self.payment = grpcModel.payment.toModel()
        self.price = grpcModel.price.toModel()
        self.state = try OperationState(rawValue: grpcModel.state.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        self.quantity = grpcModel.quantity
        self.quantityRest = grpcModel.quantityRest
        self.instrumentType = try InstrumentType(rawValue: grpcModel.instrumentType)
            ?? { throw InvestApiError.valueOutOfRange }()
        self.date = grpcModel.date.date
        self.type = grpcModel.type
        self.operationType = try OperationType(rawValue: grpcModel.operationType.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        self.trades = grpcModel.trades.map { $0.toModel() }
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_Operation {
    func toModel() throws -> Operation {
        try Operation(grpcModel: self)
    }
}
