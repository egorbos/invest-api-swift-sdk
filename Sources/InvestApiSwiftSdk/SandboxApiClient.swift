import NIOCore

/// Протокол для взаимодействия с Tinkoff API (канал песочницы).
public protocol SandboxApiClient {
    /// Сервис для работы со счетами песочницы.
    var sandbox: SandboxService { get }
    
    /// Сервис предоставления справочной информации о пользователе.
    var user: SandboxUsersService { get }
    
    /// Сервис предоставления справочной информации о ценных бумагах.
    var instruments: InstrumentsService { get }
    
    /// Сервис получения информации о позициях и доходности портфеля в реальном времени.
    var operationsStream: OperationsStreamService { get }
    
    /// Сервис котировок.
    var marketData: MarketDataService { get }
    
    /// Сервис получения биржевой информации в реальном времени.
    var marketDataStream: MarketDataStreamService { get }
    
    /// Сервис получения информации о торговых поручениях в реальном времени.
    var ordersStream: OrdersStreamService { get }
    
    /// Отправляет запрос к Tinkoff API.
    ///
    /// ```
    /// let result = try client.sendRequest(.getSandboxPortfolio(accountId: "...", currency: .russianRuble))
    /// // Аналогично
    /// let result = try client.sandbox.getSandboxPortfolio(accountId: "...", currency: .russianRuble)
    /// ```
    ///
    ///  - Parameter request: Экземпляр запроса.
    ///
    ///  - Returns: Результат запроса к Tinkoff API, являющегося экземпляром типа `Result`.
    func sendRequest<Result>(_ request: SandboxApiRequest<Result>) throws -> EventLoopFuture<Result>
    
    /// Возвращает поток предоставления информации в реальном времени.
    ///
    /// ```
    /// let stream = client.stream(.trades(["..."])) { message in
    ///     // Обработка сообщения
    /// }
    /// // Аналогично
    /// let stream = client.ordersStream.tradesStream(accounts: ["..."]) { message in
    ///     // Обработка сообщения
    /// }
    /// ```
    ///
    ///  - Parameters:
    ///      - stream: Необходимый поток.
    ///      - handler: Обработчик событий поступления сообщений из потока.
    ///
    ///  - Returns: Поток предоставления информации в реальном времени.
    func stream<Stream>(_ stream: SandboxStreamWrapper<Stream>, handler: @escaping (any StreamData) -> Void) -> Stream
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Отправляет запрос к Tinkoff API.
    ///
    /// ```
    /// let result = try await client.sendRequest(.getInfo) // Аналогично try await client.user.getInfo()
    /// ```
    ///
    ///  - Parameter request: Экземпляр запроса.
    ///
    ///  - Returns: Результат запроса к Tinkoff API, являющегося экземпляром типа `Result`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func sendRequest<Result>(_ request: SandboxAsyncApiRequest<Result>) async throws -> Result
    
    /// Возвращает поток предоставления информации в реальном времени.
    ///
    /// ```
    /// let stream = client.stream(.trades(["..."])) { message in
    ///     // Обработка сообщения
    /// }
    /// // Аналогично
    /// let stream = client.ordersStream.tradesStream(accounts: ["..."]) { message in
    ///     // Обработка сообщения
    /// }
    /// ```
    ///
    ///  - Parameters:
    ///      - stream: Необходимый поток.
    ///      - handler: Обработчик событий поступления сообщений из потока.
    ///
    ///  - Returns: Поток предоставления информации в реальном времени.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func stream<Stream>(_ stream: SandboxAsyncStreamWrapper<Stream>) -> Stream
#endif
}

public extension SandboxApiClient {
    func sendRequest<Result>(_ request: SandboxApiRequest<Result>) throws -> EventLoopFuture<Result> {
        return try request.send(client: self)
    }
}

public extension SandboxApiClient {
    func stream<Stream>(_ stream: SandboxStreamWrapper<Stream>, handler: @escaping (any StreamData) -> Void) -> Stream {
        return stream.get(client: self, handler: handler)
    }
}

internal final class SandboxInvestApiClient: SandboxApiClient {
    private let connection: ApiConnection
    
    let sandbox: SandboxService
    let user: SandboxUsersService
    let instruments: InstrumentsService
    let operationsStream: OperationsStreamService
    let marketData: MarketDataService
    let marketDataStream: MarketDataStreamService
    let ordersStream: OrdersStreamService
    
    init(_ target: ApiTarget, token: String, appName: String) throws {
        self.connection = try ApiConnection(target: target)
        let builder = ServicesBuilder(self.connection.channel, token: token, appName: appName)
        self.sandbox = builder.makeSandboxService()
        self.user = builder.makeUsersService()
        self.instruments = builder.makeInstrumentsService()
        self.operationsStream = builder.makeOperationsStreamService()
        self.marketData = builder.makeMarketDataService()
        self.marketDataStream = builder.makeMarketDataStreamService()
        self.ordersStream = builder.makeOrdersStreamService()
    }
    
    deinit {
        self.connection.close()
    }
}
