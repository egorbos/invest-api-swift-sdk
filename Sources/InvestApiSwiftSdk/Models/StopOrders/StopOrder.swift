import Foundation

/// Стоп-заявка.
public struct StopOrder: Codable {
    /// Идентификатор стоп-заявки.
    let stopOrderId: String
    
    /// Figi-идентификатор инструмента.
    let figi: String
    
    /// Uid идентификатор инструмента.
    let uid: String

    /// Направление операции.
    let direction: OrderDirection
    
    /// Тип стоп-заявки.
    let orderType: StopOrderType
    
    /// Валюта стоп-заявки.
    let currency: String // MARK: Возможно изменить на CurrencyType?
    
    /// Количество запрошенных лотов.
    let lotsRequested: Int64
    
    /// Цена заявки за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    let price: MoneyValue
    
    /// Цена активации стоп-заявки за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    let stopPrice: MoneyValue
    
    /// Дата и время конвертации стоп-заявки в биржевую в часовом поясе UTC.
    let activationDate: Date
    
    /// Дата и время снятия заявки в часовом поясе UTC.
    let expirationDate: Date
    
    /// Дата и время выставления заявки в часовом поясе UTC.
    let creationDate: Date
}

internal extension StopOrder {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_StopOrder) throws {
        self.stopOrderId = grpcModel.stopOrderID
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.direction = try OrderDirection(rawValue: grpcModel.direction.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
        self.orderType = try StopOrderType(rawValue: grpcModel.orderType.rawValue)  ?? { throw InvestApiError.valueOutOfRange }()
        self.currency = grpcModel.currency
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
