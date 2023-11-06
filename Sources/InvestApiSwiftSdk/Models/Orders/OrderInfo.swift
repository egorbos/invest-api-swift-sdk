import Foundation

/// Информация о биржевой заявке.
public struct OrderInfo: Codable {
    /// Биржевой идентификатор заявки.
    public let orderId: String
    
    /// Figi-идентификатор инструмента.
    public let figi: String
    
    /// Uid идентификатор инструмента.
    public let uid: String
    
    /// Тип заявки.
    public let type: OrderType
    
    /// Текущий статус заявки.
    public let status: OrderStatus
    
    /// Направление сделки.
    public let direction: OrderDirection
    
    /// Запрошено лотов.
    public let lotsRequested: Int64
    
    /// Исполнено лотов.
    public let lotsExecuted: Int64
    
    /// Начальная цена заявки (произведение количества запрошенных лотов на цену).
    public let initialOrderPrice: MoneyValue
    
    /// Исполненная средняя цена одного инструмента в заявке.
    public let executedOrderPrice: MoneyValue
    
    /// Итоговая стоимость заявки, включающая все комиссии.
    public let totalOrderAmount: MoneyValue
    
    /// Начальная комиссия. Комиссия рассчитанная при выставлении заявки.
    public let initialCommission: MoneyValue
    
    /// Фактическая комиссия по итогам исполнения заявки.
    public let executedCommission: MoneyValue
    
    /// Начальная цена за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    public let initialSecurityPrice: MoneyValue
    
    // MARK: Post / replace order
    
    /// Начальная цена заявки в пунктах (для фьючерсов).
    public let initialOrderPricePt: Quotation
    
    /// Накопленный купонный доход (в валюте расчётов за 1 лот).
    public let accumCouponValue: MoneyValue
    
    /// Дополнительные данные об исполнении заявки.
    public let message: String
    
    // MARK: Get orders / order state
    
    /// Средняя цена позиции по сделке.
    public let averagePositionPrice: MoneyValue
    
    /// Стадии выполнения заявки.
    public let stages: [OrderStage]
    
    /// Сервисная комиссия.
    public let serviceCommission: MoneyValue
    
    /// Валюта заявки.
    public let currency: CurrencyType
    
    /// Дата и время выставления заявки в часовом поясе UTC.
    public let date: Date
    
    /// Идентификатор ключа идемпотентности, переданный клиентом, в формате uid (максимальная длина 36 символов).
    public let orderRequestId: String?
}

internal extension OrderInfo {
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_PostOrderResponse) throws {
        self.orderId = grpcModel.orderID
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.type = try .new(rawValue: grpcModel.orderType.rawValue)
        self.status = try .new(rawValue: grpcModel.executionReportStatus.rawValue)
        self.direction = try .new(rawValue: grpcModel.direction.rawValue)
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
        
        self.averagePositionPrice = MoneyValue.null()
        self.stages = []
        self.serviceCommission = MoneyValue.null()
        self.currency = .unspecified
        self.date = Date()
        self.orderRequestId = nil
    }
    
    fileprivate init(grpcModel: Tinkoff_Public_Invest_Api_Contract_V1_OrderState) throws {
        self.orderId = grpcModel.orderID
        self.figi = grpcModel.figi
        self.uid = grpcModel.instrumentUid
        self.type = try .new(rawValue: grpcModel.orderType.rawValue)
        self.status = try .new(rawValue: grpcModel.executionReportStatus.rawValue)
        self.direction = try .new(rawValue: grpcModel.direction.rawValue)
        self.lotsRequested = grpcModel.lotsRequested
        self.lotsExecuted = grpcModel.lotsExecuted
        self.initialOrderPrice = grpcModel.initialOrderPrice.toModel()
        self.executedOrderPrice = grpcModel.executedOrderPrice.toModel()
        self.totalOrderAmount = grpcModel.totalOrderAmount.toModel()
        self.initialCommission = grpcModel.initialCommission.toModel()
        self.executedCommission = grpcModel.executedCommission.toModel()
        self.initialSecurityPrice = grpcModel.initialSecurityPrice.toModel()
        
        self.initialOrderPricePt = Quotation.zero()
        self.accumCouponValue = MoneyValue.null()
        self.message = ""
        
        self.averagePositionPrice = grpcModel.averagePositionPrice.toModel()
        self.stages = grpcModel.stages.map { $0.toModel() }
        self.serviceCommission = grpcModel.serviceCommission.toModel()
        self.currency = try .new(rawValue: grpcModel.currency)
        self.date = grpcModel.orderDate.date
        self.orderRequestId = grpcModel.orderRequestID
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
