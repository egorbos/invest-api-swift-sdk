import NIOCore
import Foundation

/// Сервис для работы с песочницей.
public protocol SandboxService {
    /// Регистрирует счёт в песочнице.
    ///
    ///  - Returns: Идентификатор зарегистрированного счёта.
    func openSandboxAccount() -> EventLoopFuture<String>
    
    /// Получает счета в песочнице.
    ///
    ///  - Returns: Массив счетов песочницы `[Account]`.
    func getSandboxAccounts() throws -> EventLoopFuture<[Account]>
    
    /// Закрывает счёт в песочнице.
    ///
    ///  - Parameter accountId: Идентификатор счёта песочницы.
    func closeSandboxAccount(accountId id: String) -> EventLoopFuture<Void>
    
    /// Выставляет заявку в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - orderRequestId: Идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - type: Тип заявки.
    ///     - direction: Направление операции.
    ///     - price: Цена за 1 инструмент (игнорируется для рыночных поручений).
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    func postSandboxOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) throws -> EventLoopFuture<OrderInfo>
    
    /// Изменяет заявку выставленную в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Биржевой идентификатор заявки.
    ///     - orderRequestId: Новый идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - price: Цена за 1 инструмент.
    ///     - priceType: Тип цены.
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    func replaceSandboxOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) throws -> EventLoopFuture<OrderInfo>
    
    /// Получает список активных заявок по счёту песочницы.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    /// - Returns: Список активных торговых поручений `[OrderInfo]`.
    func getSandboxOrders(accountId: String) throws -> EventLoopFuture<[OrderInfo]>
    
    /// Отменяет заявку выставленную в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Идентификатор заявки.
    ///
    /// - Returns: Дата и время отмены заявки в часовом поясе UTC `Date`.
    func cancelSandboxOrder(accountId: String, orderId: String) -> EventLoopFuture<Date>
    
    /// Получает статус заявки в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Идентификатор заявки.
    ///
    /// - Returns: Информация о торговом поручении `OrderInfo`.
    func getSandboxOrderState(accountId: String, orderId: String) throws -> EventLoopFuture<OrderInfo>
    
    /// Получает список позиций в песочнице.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    /// - Returns: Позиции по счёту `PositionsCollection`.
    func getSandboxPositions(accountId: String) -> EventLoopFuture<PositionsCollection>
    
    /// Получает список операций по счёту песочницы.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - state: Статус запрашиваемых операций.
    ///     - figi: Figi идентификатор инструмента для фильтрации.
    ///
    /// - Returns: Список операций по счёту `[Operation]`.
    func getSandboxOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) throws -> EventLoopFuture<[Operation]>
    
    /// Получает список операций по счёту песочницы с пагинацией.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - cursor: Идентификатор элемента, с которого формируется начало списка.
    ///     - limit: Лимит количества операций. По умолчанию устанавливается значение 100, максимальное значение 1000.
    ///     - types: Типы операций.
    ///     - state: Статус запрашиваемых операций.
    ///     - withCommissions: Включить комиссии.
    ///     - withTrades: Включить массив сделок.
    ///     - withOvernights: Вкличить overnight операции.
    ///
    /// - Returns: Список операций по счёту с пагинацией `OperationsByCursor`.
    func getSandboxOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) throws -> EventLoopFuture<OperationsByCursor>
    
    /// Получает портфель по счёту песочницы.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    /// - Returns: Портфель по счёту `Portfolio`.
    func getSandboxPortfolio(accountId: String, currency: CurrencyType) throws -> EventLoopFuture<Portfolio>
    
    /// Пополняет счёт в песочнице.
    ///
    ///  - Parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    ///      - amount: Сумма пополнения счёта в рублях.
    ///
    ///  - Returns: Текущий баланс счёта `MoneyValue`.
    func sandboxPayIn(accountId id: String, amount: MoneyValue) throws -> EventLoopFuture<MoneyValue>
    
    /// Получает доступный остаток для вывода средств в песочнице.
    ///
    ///  - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Доступный остаток для вывода средств `WithdrawLimits`.
    func getSandboxWithdrawLimits(accountId id: String) -> EventLoopFuture<WithdrawLimits>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Регистрирует счёт в песочнице.
    ///
    ///  - Returns: Идентификатор зарегистрированного счёта.
    func openSandboxAccount() async throws -> String
    
    /// Получает счета в песочнице.
    ///
    ///  - Returns: Массив счетов песочницы `[Account]`.
    func getSandboxAccounts() async throws -> [Account]
    
    /// Закрывает счёт в песочнице.
    func closeSandboxAccount(accountId id: String) async throws -> Void
    
    /// Выставляет заявку в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - orderRequestId: Идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - type: Тип заявки.
    ///     - direction: Направление операции.
    ///     - price: Цена за 1 инструмент (игнорируется для рыночных поручений).
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    func postSandboxOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) async throws -> OrderInfo
    
    /// Изменяет заявку выставленную в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Биржевой идентификатор заявки.
    ///     - orderRequestId: Новый идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - price: Цена за 1 инструмент.
    ///     - priceType: Тип цены.
    ///     - quantity: Количество лотов.
    ///
    /// - Returns: Информация о выставлении поручения `OrderInfo`.
    func replaceSandboxOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) async throws -> OrderInfo
    
    /// Получает список активных заявок по счёту песочницы.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    /// - Returns: Список активных торговых поручений `[OrderInfo]`.
    func getSandboxOrders(accountId: String) async throws -> [OrderInfo]
    
    /// Отменяет заявку выставленную в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Идентификатор заявки.
    ///
    /// - Returns: Дата и время отмены заявки в часовом поясе UTC `Date`.
    func cancelSandboxOrder(accountId: String, orderId: String) async throws -> Date
    
    /// Получает статус заявки в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Идентификатор заявки.
    ///
    /// - Returns: Информация о торговом поручении `OrderInfo`.
    func getSandboxOrderState(accountId: String, orderId: String) async throws -> OrderInfo
    
    /// Получает список позиций в песочнице.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    /// - Returns: Позиции по счёту `PositionsCollection`.
    func getSandboxPositions(accountId: String) async throws -> PositionsCollection
    
    /// Получает список операций по счёту песочницы.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - state: Статус запрашиваемых операций.
    ///     - figi: Figi идентификатор инструмента для фильтрации.
    ///
    /// - Returns: Список операций по счёту `[Operation]`.
    func getSandboxOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) async throws -> [Operation]
    
    /// Получает список операций по счёту песочницы с пагинацией.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - cursor: Идентификатор элемента, с которого формируется начало списка.
    ///     - limit: Лимит количества операций. По умолчанию устанавливается значение 100, максимальное значение 1000.
    ///     - types: Типы операций.
    ///     - state: Статус запрашиваемых операций.
    ///     - withCommissions: Включить комиссии.
    ///     - withTrades: Включить массив сделок.
    ///     - withOvernights: Вкличить overnight операции.
    ///
    /// - Returns: Список операций по счёту с пагинацией `OperationsByCursor`.
    func getSandboxOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) async throws -> OperationsByCursor
    
    /// Получает портфель по счёту песочницы.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    /// - Returns: Портфель по счёту `Portfolio`.
    func getSandboxPortfolio(accountId: String, currency: CurrencyType) async throws -> Portfolio
    
    /// Пополняет счёт в песочнице.
    ///
    ///  - Parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    ///      - amount: Сумма пополнения счёта в рублях.
    ///
    ///  - Returns: Текущий баланс счёта `MoneyValue`.
    func sandboxPayIn(accountId id: String, amount: MoneyValue) async throws -> MoneyValue
    
    /// Получает доступный остаток для вывода средств в песочнице.
    ///
    ///  - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Доступный остаток для вывода средств `WithdrawLimits`.
    func getSandboxWithdrawLimits(accountId id: String) async throws -> WithdrawLimits
#endif
}

internal struct GrpcSandboxService: SandboxService {
    let client: SandboxServiceClient
    
    init(_ client: SandboxServiceClient) {
        self.client = client
    }
    
    func openSandboxAccount() -> EventLoopFuture<String> {
        self.client
            .openSandboxAccount(.new())
            .response
            .map { $0.accountID }
    }
    
    func getSandboxAccounts() throws -> EventLoopFuture<[Account]> {
        self.client
            .getSandboxAccounts(.new())
            .response
            .flatMapThrowing {
                try $0.accounts.map { try $0.toModel() }
            }
    }
    
    func closeSandboxAccount(accountId id: String) -> EventLoopFuture<Void> {
        self.client
            .closeSandboxAccount(.new(accountId: id))
            .response
            .map { _ in  }
    }
    
    func postSandboxOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) throws -> EventLoopFuture<OrderInfo> {
        try self.client
            .postSandboxOrder(
                .new(
                    accountId: accountId, instrumentId: instrumentId, orderRequestId: orderRequestId,
                    type: type, direction: direction, price: price, quantity: quantity
                )
            )
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
    func replaceSandboxOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) throws -> EventLoopFuture<OrderInfo> {
        try self.client
            .replaceSandboxOrder(
                .new(
                    accountId: accountId, orderId: orderId, orderRequestId: orderRequestId,
                    price: price, priceType: priceType, quantity: quantity
                )
            )
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
    func getSandboxOrders(accountId: String) throws -> EventLoopFuture<[OrderInfo]> {
        self.client
            .getSandboxOrders(.new(accountId: accountId))
            .response
            .flatMapThrowing {
                try $0.orders.map { try $0.toModel() }
            }
    }
    
    func cancelSandboxOrder(accountId: String, orderId: String) -> EventLoopFuture<Date> {
        self.client
            .cancelSandboxOrder(.new(accountId: accountId, orderId: orderId))
            .response
            .map { $0.time.date }
    }
    
    func getSandboxOrderState(accountId: String, orderId: String) throws -> EventLoopFuture<OrderInfo> {
        self.client
            .getSandboxOrderState(.new(accountId: accountId, orderId: orderId))
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
    func getSandboxPositions(accountId: String) -> EventLoopFuture<PositionsCollection> {
        self.client
            .getSandboxPositions(.new(accountId: accountId))
            .response
            .map { $0.toModel() }
    }
    
    func getSandboxOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) throws -> EventLoopFuture<[Operation]> {
        try self.client
            .getSandboxOperations(
                .new(accountId: accountId, from: from, to: to, state: state, figi: figi)
            )
            .response
            .flatMapThrowing {
                try $0.operations.map { try $0.toModel() }
            }
    }
    
    func getSandboxOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) throws -> EventLoopFuture<OperationsByCursor> {
        try self.client
            .getSandboxOperationsByCursor(
                .new(
                    accountId: accountId, instrumentId: instrumentId, from: from, to: to, cursor: cursor,
                    limit: limit, types: types, state: state, withCommissions: withCommissions,
                    withTrades: withTrades, withOvernights: withOvernights
                )
            )
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
    func getSandboxPortfolio(accountId: String, currency: CurrencyType) throws -> EventLoopFuture<Portfolio> {
        try self.client
            .getSandboxPortfolio(.new(accountId: accountId, currency: currency))
            .response
            .map { $0.toModel() }
    }
    
    func sandboxPayIn(accountId id: String, amount: MoneyValue) throws -> EventLoopFuture<MoneyValue> {
        try self.client
            .sandboxPayIn(.new(accountId: id, amount: amount))
            .response
            .map { $0.balance.toModel() }
    }
    
    func getSandboxWithdrawLimits(accountId id: String) -> EventLoopFuture<WithdrawLimits> {
        self.client
            .getSandboxWithdrawLimits(.new(accountId: String(id)))
            .response
            .map { $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func openSandboxAccount() async throws -> String {
        try await self.client
            .openSandboxAccount(.new())
            .accountID
    }
    
    func getSandboxAccounts() async throws -> [Account] {
        try await self.client
            .getSandboxAccounts(.new())
            .accounts
            .map { try $0.toModel() }
    }
    
    func closeSandboxAccount(accountId id: String) async throws {
        _ = try await self.client
            .closeSandboxAccount(.new(accountId: id))
    }
    
    func postSandboxOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) async throws -> OrderInfo {
        try await self.client
            .postSandboxOrder(
                .new(
                    accountId: accountId, instrumentId: instrumentId, orderRequestId: orderRequestId,
                    type: type, direction: direction, price: price, quantity: quantity
                )
            )
            .toModel()
    }
    
    func replaceSandboxOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) async throws -> OrderInfo {
        try await self.client
            .replaceSandboxOrder(
                .new(
                    accountId: accountId, orderId: orderId, orderRequestId: orderRequestId,
                    price: price, priceType: priceType, quantity: quantity
                )
            )
            .toModel()
    }
    
    func getSandboxOrders(accountId: String) async throws -> [OrderInfo] {
        try await self.client
            .getSandboxOrders(.new(accountId: accountId))
            .orders
            .map { try $0.toModel() }
    }
    
    func cancelSandboxOrder(accountId: String, orderId: String) async throws -> Date {
        try await self.client
            .cancelSandboxOrder(.new(accountId: accountId, orderId: orderId))
            .time
            .date
    }
    
    func getSandboxOrderState(accountId: String, orderId: String) async throws -> OrderInfo {
        try await self.client
            .getSandboxOrderState(.new(accountId: accountId, orderId: orderId))
            .toModel()
    }
    
    func getSandboxPositions(accountId: String) async throws -> PositionsCollection {
        try await self.client
            .getSandboxPositions(.new(accountId: accountId))
            .toModel()
    }
    
    func getSandboxOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) async throws -> [Operation] {
        try await self.client
            .getSandboxOperations(
                .new(accountId: accountId, from: from, to: to, state: state, figi: figi)
            )
            .operations
            .map { try $0.toModel() }
    }
    
    func getSandboxOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) async throws -> OperationsByCursor {
        try await self.client
            .getSandboxOperationsByCursor(
                .new(
                    accountId: accountId, instrumentId: instrumentId, from: from, to: to, cursor: cursor,
                    limit: limit, types: types, state: state, withCommissions: withCommissions,
                    withTrades: withTrades, withOvernights: withOvernights
                )
            )
            .toModel()
    }
    
    func getSandboxPortfolio(accountId: String, currency: CurrencyType) async throws -> Portfolio {
        try await self.client
            .getSandboxPortfolio(.new(accountId: accountId, currency: currency))
            .toModel()
    }
    
    func sandboxPayIn(accountId id: String, amount: MoneyValue) async throws -> MoneyValue {
        try await self.client
            .sandboxPayIn(try .new(accountId: id, amount: amount))
            .balance
            .toModel()
    }
    
    func getSandboxWithdrawLimits(accountId id: String) async throws -> WithdrawLimits {
        try await self.client
            .getSandboxWithdrawLimits(.new(accountId: id))
            .toModel()
    }
#endif
}
