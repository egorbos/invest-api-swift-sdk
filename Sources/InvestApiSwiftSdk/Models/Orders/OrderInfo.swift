import Foundation

/// Информация о биржевой заявке.
public protocol OrderInfo {
    /// Биржевой идентификатор заявки.
    var orderId: String { get }
    
    /// Figi-идентификатор инструмента.
    var figi: String { get }
    
    /// Uid идентификатор инструмента.
    var uid: String { get }
    
    /// Тип заявки.
    var type: OrderType { get }
    
    /// Текущий статус заявки.
    var status: OrderStatus { get }
    
    /// Направление сделки.
    var direction: OrderDirection { get }
    
    /// Запрошено лотов.
    var lotsRequested: Int64 { get }
    
    /// Исполнено лотов.
    var lotsExecuted: Int64 { get }
    
    /// Начальная цена заявки (произведение количества запрошенных лотов на цену).
    var initialOrderPrice: MoneyValue { get }
    
    /// Исполненная средняя цена одного инструмента в заявке.
    var executedOrderPrice: MoneyValue { get }
    
    /// Итоговая стоимость заявки, включающая все комиссии.
    var totalOrderAmount: MoneyValue { get }
    
    /// Начальная комиссия. Комиссия рассчитанная при выставлении заявки.
    var initialCommission: MoneyValue { get }
    
    /// Фактическая комиссия по итогам исполнения заявки.
    var executedCommission: MoneyValue { get }
    
    /// Начальная цена за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    var initialSecurityPrice: MoneyValue { get }
    
    // MARK: Post / replace order
    
    /// Начальная цена заявки в пунктах (для фьючерсов).
    var initialOrderPricePt: Quotation { get }
    
    /// Накопленный купонный доход (в валюте расчётов за 1 лот).
    var accumCouponValue: MoneyValue { get }
    
    /// Дополнительные данные об исполнении заявки.
    var message: String { get }
    
    // MARK: Get orders / order state
    
    /// Средняя цена позиции по сделке.
    var averagePositionPrice: MoneyValue { get }
    
    /// Стадии выполнения заявки.
    var stages: [OrderStage] { get }
    
    /// Сервисная комиссия.
    var serviceCommission: MoneyValue { get }
    
    /// Валюта заявки.
    var currency: CurrencyType { get }
    
    /// Дата и время выставления заявки в часовом поясе UTC.
    var date: Date { get }
    
    /// Идентификатор ключа идемпотентности, переданный клиентом, в формате uid (максимальная длина 36 символов).
    var orderRequestId: String? { get }
}

internal struct OrderInfoModel: OrderInfo {
    let orderId: String
    
    let figi: String
    
    let uid: String
    
    let type: OrderType
    
    let status: OrderStatus
    
    let direction: OrderDirection
    
    let lotsRequested: Int64
    
    let lotsExecuted: Int64
    
    let initialOrderPrice: MoneyValue
    
    let executedOrderPrice: MoneyValue
    
    let totalOrderAmount: MoneyValue
    
    let initialCommission: MoneyValue
    
    let executedCommission: MoneyValue
    
    let initialSecurityPrice: MoneyValue
    
    let initialOrderPricePt: Quotation
    
    let accumCouponValue: MoneyValue
    
    let message: String
    
    let averagePositionPrice: MoneyValue
    
    let stages: [OrderStage]
    
    let serviceCommission: MoneyValue
    
    let currency: CurrencyType
    
    let date: Date
    
    let orderRequestId: String?
}

internal extension OrderInfoModel {
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
    func toModel() throws -> OrderInfoModel {
        try OrderInfoModel(grpcModel: self)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderState {
    func toModel() throws -> OrderInfoModel {
        try OrderInfoModel(grpcModel: self)
    }
}
