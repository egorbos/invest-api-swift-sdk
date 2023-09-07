import NIOCore
import Foundation

/// Сервис работы с торговыми поручениями.
public protocol OrdersService {
    /// Выставляет биржевую заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - orderRequestId: Идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - type: Тип заявки.
    ///     - direction: Направление операции.
    ///     - price: Цена за 1 инструмент (игнорируется для рыночных поручений).
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    func postOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) throws -> EventLoopFuture<OrderInfo>
    
    /// Отменяет биржевую заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - orderId: Биржевой идентификатор заявки.
    ///
    /// - Returns: Дата и время отмены заявки в часовом поясе UTC `Date`.
    func cancelOrder(accountId: String, orderId: String) throws -> EventLoopFuture<Date>
    
    /// Получает статус биржевой заявки.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - orderId: Биржевой идентификатор заявки.
    ///
    /// - Returns: Информация о торговом поручении `OrderInfo`.
    func getOrderState(accountId: String, orderId: String) throws -> EventLoopFuture<OrderInfo>
    
    /// Получает список активных заявок по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта пользователя.
    ///
    /// - Returns: Список активных торговых поручений `[OrderInfo]`.
    func getOrders(accountId: String) throws -> EventLoopFuture<[OrderInfo]>
    
    /// Изменяет выставленную заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - orderId: Биржевой идентификатор заявки.
    ///     - orderRequestId: Новый идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - price: Цена за 1 инструмент.
    ///     - priceType: Тип цены.
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    func replaceOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) throws -> EventLoopFuture<OrderInfo>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Выставляет биржевую заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - orderRequestId: Идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - type: Тип заявки.
    ///     - direction: Направление операции.
    ///     - price: Цена за 1 инструмент (игнорируется для рыночных поручений).
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func postOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) async throws -> OrderInfo
    
    /// Отменяет биржевую заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - orderId: Биржевой идентификатор заявки.
    ///
    /// - Returns: Дата и время отмены заявки в часовом поясе UTC `Date`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func cancelOrder(accountId: String, orderId: String) async throws -> Date
    
    /// Получает статус биржевой заявки.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - orderId: Биржевой идентификатор заявки.
    ///
    /// - Returns: Информация о торговом поручении `OrderInfo`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getOrderState(accountId: String, orderId: String) async throws -> OrderInfo
    
    /// Получает список активных заявок по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта пользователя.
    ///
    /// - Returns: Список активных торговых поручений `[OrderInfo]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getOrders(accountId: String) async throws -> [OrderInfo]
    
    /// Изменяет выставленную заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - orderId: Биржевой идентификатор заявки.
    ///     - orderRequestId: Новый идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - price: Цена за 1 инструмент.
    ///     - priceType: Тип цены.
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func replaceOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) async throws -> OrderInfo
#endif
}

internal struct GrpcOrdersService: OrdersService {
    let client: OrdersServiceClient
    
    init(_ client: OrdersServiceClient) {
        self.client = client
    }
    
    func postOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) throws -> EventLoopFuture<OrderInfo> {
        self.client
            .postOrder(
                try Requests
                    .OrdersServiceRequests
                    .postOrderRequest
                    .with(
                        accountId: accountId, instrumentId: instrumentId, orderRequestId: orderRequestId,
                        type: type, direction: direction, price: price, quantity: quantity
                    )
            )
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
    func cancelOrder(accountId: String, orderId: String) throws -> EventLoopFuture<Date> {
        self.client
            .cancelOrder(
                Requests
                    .OrdersServiceRequests
                    .cancelOrderRequest
                    .with(accountId: accountId, orderId: orderId)
            )
            .response
            .map { $0.time.date }
    }
    
    func getOrderState(accountId: String, orderId: String) throws -> EventLoopFuture<OrderInfo> {
        self.client
            .getOrderState(
                Requests
                    .OrdersServiceRequests
                    .getOrderStateRequest
                    .with(accountId: accountId, orderId: orderId)
            )
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
    func getOrders(accountId: String) throws -> EventLoopFuture<[OrderInfo]> {
        self.client
            .getOrders(
                Requests
                    .OrdersServiceRequests
                    .getOrdersRequest
                    .with(accountId: accountId)
            )
            .response
            .flatMapThrowing { try $0.orders.map { try $0.toModel() } }
    }
    
    func replaceOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) throws -> EventLoopFuture<OrderInfo> {
        self.client
            .replaceOrder(
                try Requests
                        .OrdersServiceRequests
                        .replaceOrderRequest
                        .with(
                            accountId: accountId, orderId: orderId, orderRequestId: orderRequestId,
                            price: price, priceType: priceType, quantity: quantity
                        )
            )
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func postOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) async throws -> OrderInfo {
        try await self.client
            .postOrder(
                try Requests
                    .OrdersServiceRequests
                    .postOrderRequest
                    .with(
                        accountId: accountId, instrumentId: instrumentId, orderRequestId: orderRequestId,
                        type: type, direction: direction, price: price, quantity: quantity
                    )
            )
            .toModel()
    }
    
    func cancelOrder(accountId: String, orderId: String) async throws -> Date {
        try await self.client
            .cancelOrder(
                Requests
                    .OrdersServiceRequests
                    .cancelOrderRequest
                    .with(accountId: accountId, orderId: orderId)
            )
            .time
            .date
    }
    
    func getOrderState(accountId: String, orderId: String) async throws -> OrderInfo {
        try await self.client
            .getOrderState(
                Requests
                    .OrdersServiceRequests
                    .getOrderStateRequest
                    .with(accountId: accountId, orderId: orderId)
            )
            .toModel()
    }
    
    func getOrders(accountId: String) async throws -> [OrderInfo] {
        try await self.client
            .getOrders(
                Requests
                    .OrdersServiceRequests
                    .getOrdersRequest
                    .with(accountId: accountId)
            )
            .orders
            .map { try $0.toModel() }
    }
    
    func replaceOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) async throws -> OrderInfo {
        try await self.client
            .replaceOrder(
                try Requests
                        .OrdersServiceRequests
                        .replaceOrderRequest
                        .with(
                            accountId: accountId, orderId: orderId, orderRequestId: orderRequestId,
                            price: price, priceType: priceType, quantity: quantity
                        )
            )
            .toModel()
    }
#endif
}
