import Foundation

/// Информация о биржевой заявке.
public struct OrderInfo: Codable {
    /// Биржевой идентификатор заявки.
    let orderId: String
    
    /// Figi-идентификатор инструмента.
    let figi: String
    
    /// Uid идентификатор инструмента.
    let uid: String
    
    /// Тип заявки.
    let type: OrderType
    
    /// Текущий статус заявки.
    let status: OrderStatus
    
    /// Направление сделки.
    let direction: OrderDirection
    
    /// Запрошено лотов.
    let lotsRequested: Int64
    
    /// Исполнено лотов.
    let lotsExecuted: Int64
    
    /// Начальная цена заявки (произведение количества запрошенных лотов на цену).
    let initialOrderPrice: MoneyValue
    
    /// Исполненная средняя цена одного инструмента в заявке.
    let executedOrderPrice: MoneyValue
    
    /// Итоговая стоимость заявки, включающая все комиссии.
    let totalOrderAmount: MoneyValue
    
    /// Начальная комиссия. Комиссия рассчитанная при выставлении заявки.
    let initialCommission: MoneyValue
    
    /// Фактическая комиссия по итогам исполнения заявки.
    let executedCommission: MoneyValue
    
    /// Начальная цена за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    let initialSecurityPrice: MoneyValue
    
    // MARK: Post / replace order
    
    /// Начальная цена заявки в пунктах (для фьючерсов).
    let initialOrderPricePt: Quotation
    
    /// Накопленный купонный доход (в валюте расчётов за 1 лот).
    let accumCouponValue: MoneyValue
    
    /// Дополнительные данные об исполнении заявки.
    let message: String
    
    // MARK: Get orders / order state
    
    /// Средняя цена позиции по сделке.
    let averagePositionPrice: MoneyValue
    
    /// Стадии выполнения заявки.
    let stages: [OrderStage]
    
    /// Сервисная комиссия.
    let serviceCommission: MoneyValue
    
    /// Валюта заявки.
    let currency: String // MARK: Возможно изменить на CurrencyType?
    
    /// Дата и время выставления заявки в часовом поясе UTC.
    let date: Date
    
    /// Идентификатор ключа идемпотентности, переданный клиентом, в формате uid (максимальная длина 36 символов).
    let orderRequestId: String?
}

internal extension OrderInfo {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse) throws {
        self.orderId = grpcModel.orderID
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.type = try OrderType(rawValue: grpcModel.orderType.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
        self.status = try OrderStatus(rawValue: grpcModel.executionReportStatus.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
        self.direction = try OrderDirection(rawValue: grpcModel.direction.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
        self.lotsRequested = grpcModel.lotsRequested
        self.lotsExecuted = grpcModel.lotsExecuted
        self.initialOrderPrice = grpcModel.initialOrderPrice.toModel()
        self.executedOrderPrice = grpcModel.executedOrderPrice.toModel()
        self.totalOrderAmount = grpcModel.totalOrderAmount.toModel()
        self.initialCommission = grpcModel.initialCommission.toModel()
        self.executedCommission = grpcModel.executedCommission.toModel()
        self.initialSecurityPrice = grpcModel.initialSecurityPrice.toModel()
        self.initialOrderPricePt = grpcModel.initialOrderPricePt.toModel()
        self.accumCouponValue = grpcModel.aciValue.toModel()
        self.message = grpcModel.message
    }
    
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderState) throws {
        self.orderId = grpcModel.orderID
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.type = try OrderType(rawValue: grpcModel.orderType.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
        self.status = try OrderStatus(rawValue: grpcModel.executionReportStatus.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
        self.direction = try OrderDirection(rawValue: grpcModel.direction.rawValue) ?? { throw InvestApiError.valueOutOfRange }()
        self.lotsRequested = grpcModel.lotsRequested
        self.lotsExecuted = grpcModel.lotsExecuted
        self.initialOrderPrice = grpcModel.initialOrderPrice.toModel()
        self.executedOrderPrice = grpcModel.executedOrderPrice.toModel()
        self.totalOrderAmount = grpcModel.totalOrderAmount.toModel()
        self.initialCommission = grpcModel.initialCommission.toModel()
        self.executedCommission = grpcModel.executedCommission.toModel()
        self.initialSecurityPrice = grpcModel.initialSecurityPrice.toModel()
        self.averagePositionPrice = grpcModel.averagePositionPrice.toModel()
        self.stages = grpcModel.stages.map { $0.toModel() }
        self.serviceCommission = grpcModel.serviceCommission.toModel()
        self.currency = grpcModel.currency
        self.date = grpcModel.orderDate.date
        // self.orderRequestId = grpcModel.orderRequestId
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse {
    func toModel() throws -> OrderInfo {
        try OrderInfo(grpcModel: self)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderState {
    func toModel() throws -> OrderInfo {
        try OrderInfo(grpcModel: self)
    }
}
