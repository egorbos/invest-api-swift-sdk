import NIOCore
import Foundation

/// Сервис получения списка операций по счёту, портфеля по счёту, позиций ценных бумаг на счёте и т.д.
public protocol OperationsService {
    /// Получает список операций по счёту.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - state: Статус запрашиваемых операций.
    ///     - figi: Figi идентификатор инструмента для фильтрации.
    ///
    /// - Returns: Список операций по счёту `[Operation]`.
    func getOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) throws -> EventLoopFuture<[Operation]>
    
    /// Получает портфель по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Портфель по счёту `Portfolio`.
    func getPortfolio(accountId: String, currency: CurrencyType) throws -> EventLoopFuture<Portfolio>
    
    /// Получает список позиций по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Позиции по счёту `PositionsCollection`.
    func getPositions(accountId: String) throws -> EventLoopFuture<PositionsCollection>
    
    /// Получает доступный остаток для вывода средств.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Доступный остаток для вывода средств `WithdrawLimits`.
    func getWithdrawLimits(accountId: String) throws -> EventLoopFuture<WithdrawLimits>
    
    /// Отправляет запрос на формирование брокерского отчёта.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Идентификатор задачи формирования брокерского отчёта `String`.
    func generateBrokerReport(accountId: String, from: Date, to: Date) throws -> EventLoopFuture<String>
    
    /// Получает брокерский отчёт.
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 1), значение по умолчанию: 0.
    ///
    /// - Returns: Брокерский отчёт `BrokerReport`.
    func getBrokerReport(taskId: String, page: Int32) throws -> EventLoopFuture<BrokerReport>
    
    /// Отправляет запрос на формирование отчёта "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Идентификатор задачи формирования брокерского отчёта `String`.
    func generateDivForeignIssuerReport(accountId: String, from: Date, to: Date) throws -> EventLoopFuture<String>
    
    /// Получает отчёт "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 0), значение по умолчанию: 0.
    ///
    /// - Returns: Отчёт "Справка о доходах за пределами РФ" `DividendsForeignIssuerReport`.
    func getDivForeignIssuerReport(taskId: String, page: Int32) throws -> EventLoopFuture<DividendsForeignIssuerReport>
    
    /// Получает список операций по счёту с пагинацией.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
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
    func getOperationsByCursor(
        accountId id: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) throws -> EventLoopFuture<OperationsByCursor>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Получает список операций по счёту.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - state: Статус запрашиваемых операций.
    ///     - figi: Figi идентификатор инструмента для фильтрации.
    ///
    /// - Returns: Список операций по счёту `[Operation]`.
    func getOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) async throws -> [Operation]
    
    /// Получает портфель по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Портфель по счёту `Portfolio`.
    func getPortfolio(accountId: String, currency: CurrencyType) async throws -> Portfolio
    
    /// Получает список позиций по счёту.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Позиции по счёту `PositionsCollection`.
    func getPositions(accountId: String) async throws -> PositionsCollection
    
    /// Получает доступный остаток для вывода средств.
    ///
    /// - Parameter accountId: Идентификатор счёта.
    ///
    /// - Returns: Доступный остаток для вывода средств `WithdrawLimits`.
    func getWithdrawLimits(accountId: String) async throws -> WithdrawLimits
    
    /// Отправляет запрос на формирование брокерского отчёта.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Идентификатор задачи формирования брокерского отчёта `String`.
    func generateBrokerReport(accountId: String, from: Date, to: Date) async throws -> String
    
    /// Получает брокерский отчёт.
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 1), значение по умолчанию: 0.
    ///
    /// - Returns: Брокерский отчёт `BrokerReport`.
    func getBrokerReport(taskId: String, page: Int32) async throws -> BrokerReport
    
    /// Отправляет запрос на формирование отчёта "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Идентификатор задачи формирования брокерского отчёта `String`.
    func generateDivForeignIssuerReport(accountId: String, from: Date, to: Date) async throws -> String
    
    /// Получает отчёт "Справка о доходах за пределами РФ".
    ///
    /// - Parameters:
    ///     - taskId: Идентификатор задачи формирования брокерского отчёта.
    ///     - page: Номер страницы отчета (начинается с 0), значение по умолчанию: 0.
    ///
    /// - Returns: Отчёт "Справка о доходах за пределами РФ" `DividendsForeignIssuerReport`.
    func getDivForeignIssuerReport(taskId: String, page: Int32) async throws -> DividendsForeignIssuerReport
    
    /// Получает список операций по счёту с пагинацией.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта пользователя.
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
    func getOperationsByCursor(
        accountId id: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) async throws -> OperationsByCursor
#endif
}

internal struct GrpcOperationsService: OperationsService {
    let client: OperationsServiceClient
    
    init(_ client: OperationsServiceClient) {
        self.client = client
    }
    
    func getOperations(accountId id: String, from: Date, to: Date, state: OperationState, figi: String) throws -> EventLoopFuture<[Operation]> {
        self.client
            .getOperations(
                try Requests
                        .OperationsServiceRequests
                        .getOperationsRequest
                        .with(accountId: id, from: from, to: to, state: state, figi: figi)
            )
            .response
            .flatMapThrowing { try $0.operations.map { try $0.toModel() } }
    }
    
    func getPortfolio(accountId id: String, currency: CurrencyType) throws -> EventLoopFuture<Portfolio> {
        self.client
            .getPortfolio(
                try Requests
                        .OperationsServiceRequests
                        .getPortfolioRequest
                        .with(accountId: id, currency: currency)
            )
            .response
            .flatMapThrowing { try $0.toModel()}
    }
    
    func getPositions(accountId id: String) throws -> EventLoopFuture<PositionsCollection> {
        self.client
            .getPositions(
                Requests
                    .OperationsServiceRequests
                    .getPositionsRequest
                    .with(accountId: id)
            )
            .response
            .map { $0.toModel() }
    }
    
    func getWithdrawLimits(accountId id: String) throws -> EventLoopFuture<WithdrawLimits> {
        self.client
            .getWithdrawLimits(
                Requests
                    .OperationsServiceRequests
                    .getWithdrawLimitsRequest
                    .with(accountId: id)
            )
            .response
            .map { $0.toModel() }
    }
    
    func generateBrokerReport(accountId id: String, from: Date, to: Date) throws -> EventLoopFuture<String> {
        self.client
            .getBrokerReport(
                Requests
                    .OperationsServiceRequests
                    .brokerReportRequest
                    .generate(accountId: id, from: from, to: to)
            )
            .response
            .map { $0.generateBrokerReportResponse.taskID }
    }
    
    func getBrokerReport(taskId id: String, page: Int32) throws -> EventLoopFuture<BrokerReport> {
        self.client
            .getBrokerReport(
                Requests
                    .OperationsServiceRequests
                    .brokerReportRequest
                    .get(taskId: id, page: page)
            )
            .response
            .map { $0.getBrokerReportResponse.toModel() }
    }
    
    func generateDivForeignIssuerReport(accountId id: String, from: Date, to: Date) throws -> EventLoopFuture<String> {
        self.client
            .getDividendsForeignIssuer(
                Requests
                    .OperationsServiceRequests
                    .divForeignIssuerReportRequest
                    .generate(accountId: id, from: from, to: to)
            )
            .response
            .map { $0.generateDivForeignIssuerReportResponse.taskID }
    }
    
    func getDivForeignIssuerReport(taskId id: String, page: Int32) throws -> EventLoopFuture<DividendsForeignIssuerReport> {
        self.client
            .getDividendsForeignIssuer(
                Requests
                    .OperationsServiceRequests
                    .divForeignIssuerReportRequest
                    .get(taskId: id, page: page)
            )
            .response
            .map { $0.divForeignIssuerReport.toModel() }
    }
    
    func getOperationsByCursor(
        accountId id: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32 = 100, types: [OperationType], state: OperationState,
        withCommissions: Bool, withTrades: Bool, withOvernights: Bool
    ) throws -> EventLoopFuture<OperationsByCursor> {
        self.client
            .getOperationsByCursor(
                try Requests
                        .OperationsServiceRequests
                        .getOperationsByCursorRequest
                        .with(
                            accountId: id, instrumentId: instrumentId, from: from, to: to,
                            cursor: cursor, limit: limit, types: types, state: state,
                            withCommissions: withCommissions, withTrades: withTrades, withOvernights: withOvernights
                        )
            )
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func getOperations(accountId id: String, from: Date, to: Date, state: OperationState, figi: String) async throws -> [Operation] {
        try await self.client
            .getOperations(
                try Requests
                        .OperationsServiceRequests
                        .getOperationsRequest
                        .with(accountId: id, from: from, to: to, state: state, figi: figi)
            )
            .operations
            .map { try $0.toModel() }
    }
    
    func getPortfolio(accountId id: String, currency: CurrencyType) async throws -> Portfolio {
        try await self.client
            .getPortfolio(
                try Requests
                        .OperationsServiceRequests
                        .getPortfolioRequest
                        .with(accountId: id, currency: currency)
            )
            .toModel()
    }
    
    func getPositions(accountId id: String) async throws -> PositionsCollection {
        try await self.client
            .getPositions(
                Requests
                    .OperationsServiceRequests
                    .getPositionsRequest
                    .with(accountId: id)
            )
            .toModel()
    }
    
    func getWithdrawLimits(accountId id: String) async throws -> WithdrawLimits {
        try await self.client
            .getWithdrawLimits(
                Requests
                    .OperationsServiceRequests
                    .getWithdrawLimitsRequest
                    .with(accountId: id)
            )
            .toModel()
    }
    
    func generateBrokerReport(accountId id: String, from: Date, to: Date) async throws -> String {
        try await self.client
            .getBrokerReport(
                Requests
                    .OperationsServiceRequests
                    .brokerReportRequest
                    .generate(accountId: id, from: from, to: to)
            )
            .generateBrokerReportResponse
            .taskID
    }
    
    func getBrokerReport(taskId id: String, page: Int32) async throws -> BrokerReport {
        try await self.client
            .getBrokerReport(
                Requests
                    .OperationsServiceRequests
                    .brokerReportRequest
                    .get(taskId: id, page: page)
            )
            .getBrokerReportResponse
            .toModel()
    }
    
    func generateDivForeignIssuerReport(accountId id: String, from: Date, to: Date) async throws -> String {
        try await self.client
            .getDividendsForeignIssuer(
                Requests
                    .OperationsServiceRequests
                    .divForeignIssuerReportRequest
                    .generate(accountId: id, from: from, to: to)
            )
            .generateDivForeignIssuerReportResponse
            .taskID
    }
    
    func getDivForeignIssuerReport(taskId id: String, page: Int32) async throws -> DividendsForeignIssuerReport {
        try await self.client
            .getDividendsForeignIssuer(
                Requests
                    .OperationsServiceRequests
                    .divForeignIssuerReportRequest
                    .get(taskId: id, page: page)
            )
            .divForeignIssuerReport
            .toModel()
    }
    
    func getOperationsByCursor(
        accountId id: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) async throws -> OperationsByCursor {
        try await self.client
            .getOperationsByCursor(
                try Requests
                        .OperationsServiceRequests
                        .getOperationsByCursorRequest
                        .with(
                            accountId: id, instrumentId: instrumentId, from: from, to: to,
                            cursor: cursor, limit: limit, types: types, state: state,
                            withCommissions: withCommissions, withTrades: withTrades, withOvernights: withOvernights
                        )
            )
            .toModel()
    }
#endif
}
