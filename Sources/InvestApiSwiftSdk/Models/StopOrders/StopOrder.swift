import Foundation

/// Стоп-заявка.
public protocol StopOrder {
    /// Идентификатор стоп-заявки.
    var stopOrderId: String { get }
    
    /// Figi-идентификатор инструмента.
    var figi: String { get }
    
    /// Uid идентификатор инструмента.
    var uid: String { get }

    /// Направление операции.
    var direction: OrderDirection { get }
    
    /// Тип стоп-заявки.
    var orderType: StopOrderType { get }
    
    /// Валюта стоп-заявки.
    var currency: CurrencyType { get }
    
    /// Количество запрошенных лотов.
    var lotsRequested: Int64 { get }
    
    /// Цена заявки за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    var price: MoneyValue { get }
    
    /// Цена активации стоп-заявки за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    var stopPrice: MoneyValue { get }
    
    /// Дата и время конвертации стоп-заявки в биржевую в часовом поясе UTC.
    var activationDate: Date { get }
    
    /// Дата и время снятия заявки в часовом поясе UTC.
    var expirationDate: Date { get }
    
    /// Дата и время выставления заявки в часовом поясе UTC.
    var creationDate: Date { get }
}

internal struct StopOrderModel: StopOrder {
    let stopOrderId: String
    
    let figi: String
    
    let uid: String

    let direction: OrderDirection
    
    let orderType: StopOrderType
    
    let currency: CurrencyType
    
    let lotsRequested: Int64
    
    let price: MoneyValue
    
    let stopPrice: MoneyValue
    
    let activationDate: Date
    
    let expirationDate: Date
    
    let creationDate: Date
}

internal extension StopOrderModel {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_StopOrder) throws {
        self.stopOrderId = grpcModel.stopOrderID
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.direction = try .new(rawValue: grpcModel.direction.rawValue)
        self.orderType = try .new(rawValue: grpcModel.orderType.rawValue)
        self.currency = try .new(rawValue: grpcModel.currency)
        self.lotsRequested = grpcModel.lotsRequested
        self.price = grpcModel.price.toModel()
        self.stopPrice = grpcModel.stopPrice.toModel()
        self.activationDate = grpcModel.activationDateTime.date
        self.expirationDate = grpcModel.expirationTime.date
        self.creationDate = grpcModel.createDate.date
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrder {
    func toModel() throws -> StopOrderModel {
        try StopOrderModel(grpcModel: self)
    }
}
