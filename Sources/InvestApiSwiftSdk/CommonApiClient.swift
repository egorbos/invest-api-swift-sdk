import GRPC
import NIOCore

/// Протокол для взаимодействия с Tinkoff API (основной канал).
public protocol CommonApiClient {
    /// Сервис предоставления справочной информации о пользователе.
    var user: CommonUsersService { get }
    
    /// Сервис предоставления справочной информации о ценных бумагах.
    var instruments: InstrumentsService { get }
    
    /// Сервис получения информации об операциях по счёту.
    var operations: OperationsService { get }
    
    /// Сервис получения информации о позициях и доходности портфеля в реальном времени.
    var operationsStream: OperationsStreamService { get }
    
    /// Сервис котировок.
    var marketData: MarketDataService { get }
    
    /// Сервис получения биржевой информации в реальном времени.
    var marketDataStream: MarketDataStreamService { get }
    
    /// Сервис работы с торговыми поручениями.
    var orders: OrdersService { get }
    
    /// Сервис получения информации о торговых поручениях в реальном времени.
    var ordersStream: OrdersStreamService { get }
    
    /// Сервис работы со стоп-заявками.
    var stopOrders: StopOrdersService { get }
    
    /// Отправляет запрос к Tinkoff API.
    ///
    /// ```
    /// let result = try client.sendRequest(.getPortfolio(accountId: "...", currency: .russianRuble))
    /// // Аналогично
    /// let result = try client.operations.getPortfolio(accountId: "...", currency: .russianRuble)
    /// ```
    ///
    ///  - Parameter request: Экземпляр запроса.
    ///
    ///  - Returns: Результат запроса к Tinkoff API, являющегося экземпляром типа `Result`.
    func sendRequest<Result>(_ request: CommonApiRequest<Result>) throws -> EventLoopFuture<Result>
    
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
    func stream<Stream>(_ stream: CommonStreamWrapper<Stream>, handler: @escaping (any StreamData) -> Void) -> Stream
    
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
    func sendRequest<Result>(_ request: CommonAsyncApiRequest<Result>) async throws -> Result
    
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
    func stream<Stream>(_ stream: CommonAsyncStreamWrapper<Stream>) -> Stream
#endif
}

public extension CommonApiClient {
    func sendRequest<Result>(_ request: CommonApiRequest<Result>) throws -> EventLoopFuture<Result> {
        return try request.send(client: self)
    }
}

public extension CommonApiClient {
    func stream<Stream>(_ stream: CommonStreamWrapper<Stream>, handler: @escaping (any StreamData) -> Void) -> Stream {
        return stream.get(client: self, handler: handler)
    }
}

internal final class CommonInvestApiClient: CommonApiClient {
    private let connection: ApiConnection
    
    let user: CommonUsersService
    let instruments: InstrumentsService
    let operations: OperationsService
    let operationsStream: OperationsStreamService
    let marketData: MarketDataService
    let marketDataStream: MarketDataStreamService
    let orders: OrdersService
    let ordersStream: OrdersStreamService
    let stopOrders: StopOrdersService
    
    init(_ target: ApiTarget, token: String, appName: String) throws {
        self.connection = try ApiConnection(target: target)
        let builder = ServicesBuilder(self.connection.channel, token: token, appName: appName)
        self.user = builder.makeUsersService()
        self.instruments = builder.makeInstrumentsService()
        self.operations = builder.makeOperationsService()
        self.operationsStream = builder.makeOperationsStreamService()
        self.marketData = builder.makeMarketDataService()
        self.marketDataStream = builder.makeMarketDataStreamService()
        self.orders = builder.makeOrdersService()
        self.ordersStream = builder.makeOrdersStreamService()
        self.stopOrders = builder.makeStopOrdersService()
    }
    
    deinit {
        self.connection.close()
    }
}
