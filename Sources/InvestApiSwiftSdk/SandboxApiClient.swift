import GRPC
import NIOCore

/// Протокол для взаимодействия с Tinkoff API (канал песочницы).
public protocol SandboxApiClient {
    /// Сервис для работы со счетами песочницы.
    var sandbox: SandboxService { get }
    
    /// Сервис предоставления справочной информации о пользователе.
    var user: SandboxUsersService { get }
    
    /// Сервис предоставления справочной информации о ценных бумагах.
    var instruments: InstrumentsService { get }
    
    /// Сервис получения информации об операциях по счёту.
    var operations: SandboxOperationsService { get }
    
    /// Сервис котировок.
    var marketData: MarketDataService { get }
    
    /// Сервис получения биржевой информации в реальном времени.
    var marketDataStream: MarketDataStreamService { get }
    
    /// Сервис работы с торговыми поручениями.
    var orders: OrdersService { get }
    
    /// Отправляет запрос к Tinkoff API.
    ///
    /// ```
    /// let result = try client.sendRequest(.getInfo) // Аналогично try client.user.getInfo()
    /// ```
    ///
    ///  - parameters:
    ///      - request: Запрос.
    ///
    ///  - returns: Результат запроса к Tinkoff API, являющегося экземпляром типа `T`.
    func sendRequest<T>(_ req: SandboxApiRequest<T>) throws -> EventLoopFuture<T>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Отправляет запрос к Tinkoff API.
    ///
    /// ```
    /// let result = try await client.sendRequest(.getInfo) // Аналогично try await client.user.getInfo()
    /// ```
    ///
    ///  - parameters:
    ///      - request: Запрос.
    ///
    ///  - returns: Результат запроса к Tinkoff API, являющегося экземпляром типа `T`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func sendRequest<T>(_ req: SandboxAsyncApiRequest<T>) async throws -> T
#endif
}

public extension SandboxApiClient {
    func sendRequest<T>(_ req: SandboxApiRequest<T>) throws -> EventLoopFuture<T> {
        return try req.send(client: self)
    }
}

internal final class SandboxInvestApiClient: SandboxApiClient {
    private let connection: ApiConnection
    
    let sandbox: SandboxService
    let user: SandboxUsersService
    let instruments: InstrumentsService
    let operations: SandboxOperationsService
    let marketData: MarketDataService
    let marketDataStream: MarketDataStreamService
    let orders: OrdersService
    
    init(_ target: ApiTarget, token: String, appName: String) throws {
        self.connection = try ApiConnection(target: target)
        let builder = ServicesBuilder(self.connection.channel, token: token, appName: appName)
        self.sandbox = builder.makeSandboxService()
        self.user = builder.makeUsersService()
        self.instruments = builder.makeInstrumentsService()
        self.operations = builder.makeOperationsService()
        self.marketData = builder.makeMarketDataService()
        self.marketDataStream = builder.makeMarketDataStreamService()
        self.orders = builder.makeOrdersService()
    }
    
    deinit {
        self.connection.close()
    }
}
