import Foundation

protocol SandboxApiClient {
    var sandbox: SandboxService { get }
    var user: SandboxUsersService { get }
    var instruments: InstrumentsService { get }
    var operations: SandboxOperationsService { get }
    var marketData: MarketDataService { get }
    var marketDataStream: MarketDataStreamService { get }
    var orders: OrdersService { get }
}

internal final class InvestSandboxApiClient: SandboxApiClient {
    private let target: ApiTarget
    
    let sandbox: SandboxService
    let user: SandboxUsersService
    let instruments: InstrumentsService
    let operations: SandboxOperationsService
    let marketData: MarketDataService
    let marketDataStream: MarketDataStreamService
    let orders: OrdersService
    
    init(target: ApiTarget, token: String, appName: String) {
        self.target = target
        let configBuilder = ConfigurationBuilder(target, token: token, appName: appName)
        self.sandbox = GrpcSandboxService(configBuilder)
        self.user = GrpcUsersService(configBuilder)
        self.instruments = GrpcInstrumentsService(configBuilder)
        self.operations = GrpcOperationsService(configBuilder)
        self.marketData = GrpcMarketDataService(configBuilder)
        self.marketDataStream = GrpcMarketDataStreamService(configBuilder)
        self.orders = GrpcOrdersService(configBuilder)
    }
}
