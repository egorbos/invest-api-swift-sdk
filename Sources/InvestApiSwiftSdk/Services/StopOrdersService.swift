import NIOCore
import Foundation

/// Сервис работы со стоп-ордерами.
public protocol StopOrdersService {
    /// Выставляет стоп-заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - quantity: Количество лотов.
    ///     - price: Цена за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    ///     - stopPrice: Стоп-цена заявки за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    ///     - direction: Направление операции.
    ///     - stopOrderType: Тип заявки.
    ///     - expirationType: Тип экспирации заявки.
    ///     - expireDate: Дата и время окончания действия стоп-заявки в часовом поясе UTC (для expirationType = .goodTillDate заполнение обязательно).
    ///
    /// - Returns: Уникальный идентификатор стоп-заявки `String`.
    func postStopOrder(
        accountId: String, instrumentId: String, quantity: Int64, price: Quotation,
        stopPrice: Quotation, direction: OrderDirection, stopOrderType: StopOrderType,
        expirationType: StopOrderExpirationType, expireDate: Date
    ) throws -> EventLoopFuture<String>
    
    /// Получает список активных стоп-заявок по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта пользователя.
    ///
    /// - Returns: Список активных стоп-заявок `[StopOrder]`.
    func getStopOrders(accountId: String) throws -> EventLoopFuture<[StopOrder]>
    
    /// Отменяет стоп-заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - stopOrderId: Идентификатор стоп-заявки.
    ///
    /// - Returns: Время отмены заявки в часовом поясе UTC `Date`.
    func cancelStopOrder(accountId: String, stopOrderId: String) throws -> EventLoopFuture<Date>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Выставляет стоп-заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - quantity: Количество лотов.
    ///     - price: Цена за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    ///     - stopPrice: Стоп-цена заявки за 1 инструмент (для получения стоимости лота требуется умножить на лотность инструмента).
    ///     - direction: Направление операции.
    ///     - stopOrderType: Тип заявки.
    ///     - expirationType: Тип экспирации заявки.
    ///     - expireDate: Дата и время окончания действия стоп-заявки в часовом поясе UTC (для expirationType = .goodTillDate заполнение обязательно).
    ///
    /// - Returns: Уникальный идентификатор стоп-заявки `String`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func postStopOrder(
        accountId: String, instrumentId: String, quantity: Int64, price: Quotation,
        stopPrice: Quotation, direction: OrderDirection, stopOrderType: StopOrderType,
        expirationType: StopOrderExpirationType, expireDate: Date
    ) async throws -> String
    
    /// Получает список активных стоп-заявок по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта пользователя.
    ///
    /// - Returns: Список активных стоп-заявок `[StopOrder]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getStopOrders(accountId: String) async throws -> [StopOrder]
    
    /// Отменяет стоп-заявку.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - stopOrderId: Идентификатор стоп-заявки.
    ///
    /// - Returns: Время отмены заявки в часовом поясе UTC `Date`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func cancelStopOrder(accountId: String, stopOrderId: String) async throws -> Date
#endif
}

internal struct GrpcStopOrdersService: StopOrdersService {
    let client: StopOrdersServiceClient
    
    init(_ client: StopOrdersServiceClient) {
        self.client = client
    }
    
    func postStopOrder(
        accountId: String, instrumentId: String, quantity: Int64, price: Quotation,
        stopPrice: Quotation, direction: OrderDirection, stopOrderType: StopOrderType,
        expirationType: StopOrderExpirationType, expireDate: Date
    ) throws -> EventLoopFuture<String> {
        self.client
            .postStopOrder(
                try Requests
                    .StopOrdersServiceRequests
                    .postStopOrderRequest
                    .with(
                        accountId: accountId, instrumentId: instrumentId, quantity: quantity,
                        price: price, stopPrice: stopPrice, direction: direction,
                        stopOrderType: stopOrderType, expirationType: expirationType, expireDate: expireDate
                    )
            )
            .response
            .map { $0.stopOrderID }
    }
    
    func getStopOrders(accountId: String) throws -> EventLoopFuture<[StopOrder]> {
        self.client
            .getStopOrders(
                Requests
                    .StopOrdersServiceRequests
                    .getStopOrdersRequest
                    .with(accountId: accountId)
            )
            .response
            .flatMapThrowing { try $0.stopOrders.map { try $0.toModel() } }
    }
    
    func cancelStopOrder(accountId: String, stopOrderId: String) throws -> EventLoopFuture<Date> {
        self.client
            .cancelStopOrder(
                Requests
                    .StopOrdersServiceRequests
                    .cancelStopOrderRequest
                    .with(accountId: accountId, stopOrderId: stopOrderId)
            )
            .response
            .map { $0.time.date }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func postStopOrder(
        accountId: String, instrumentId: String, quantity: Int64, price: Quotation,
        stopPrice: Quotation, direction: OrderDirection, stopOrderType: StopOrderType,
        expirationType: StopOrderExpirationType, expireDate: Date
    ) async throws -> String {
        try await self.client
            .postStopOrder(
                try Requests
                    .StopOrdersServiceRequests
                    .postStopOrderRequest
                    .with(
                        accountId: accountId, instrumentId: instrumentId, quantity: quantity,
                        price: price, stopPrice: stopPrice, direction: direction,
                        stopOrderType: stopOrderType, expirationType: expirationType, expireDate: expireDate
                    )
            )
            .stopOrderID
    }
    
    func getStopOrders(accountId: String) async throws -> [StopOrder] {
        try await self.client
            .getStopOrders(
                Requests
                    .StopOrdersServiceRequests
                    .getStopOrdersRequest
                    .with(accountId: accountId)
            )
            .stopOrders
            .map { try $0.toModel() }
    }
    
    func cancelStopOrder(accountId: String, stopOrderId: String) async throws -> Date {
        try await self.client
            .cancelStopOrder(
                Requests
                    .StopOrdersServiceRequests
                    .cancelStopOrderRequest
                    .with(accountId: accountId, stopOrderId: stopOrderId)
            )
            .time
            .date
    }
#endif
}
