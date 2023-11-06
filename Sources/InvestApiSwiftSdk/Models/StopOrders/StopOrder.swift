import Foundation

/// Стоп-заявка.
public struct StopOrder: Codable {
    /// Идентификатор стоп-заявки.
    public let stopOrderId: String
    
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Uid идентификатор инструмента.
    public let uid: String

    /// Направление операции.
    public let direction: OrderDirection
    
    /// Тип стоп-заявки.
    public let orderType: StopOrderType
    
    /// Валюта стоп-заявки.
    public let currency: CurrencyType
    
    /// Количество запрошенных лотов.
    public let lotsRequested: Int64
    
    /// Цена заявки за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    public let price: MoneyValue
    
    /// Цена активации стоп-заявки за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    public let stopPrice: MoneyValue
    
    /// Дата и время конвертации стоп-заявки в биржевую в часовом поясе UTC.
    public let activationDate: Date
    
    /// Дата и время снятия заявки в часовом поясе UTC.
    public let expirationDate: Date
    
    /// Дата и время выставления заявки в часовом поясе UTC.
    public let creationDate: Date
}

internal extension StopOrder {
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
    func toModel() throws -> StopOrder {
        try StopOrder(grpcModel: self)
    }
}
