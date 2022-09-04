import Foundation

protocol CommonApiClient {
    var user: CommonUsersService { get }
    var instruments: InstrumentsService { get }
    var operations: CommonOperationsService { get }
    var operationsStream: OperationsStreamService { get }
    var marketData: MarketDataService { get }
    var marketDataStream: MarketDataStreamService { get }
    var orders: OrdersService { get }
    var ordersStream: OrdersStreamService { get }
    var stopOrders: StopOrdersService { get }
}

internal final class InvestCommonApiClient: CommonApiClient {
    private let target: ApiTarget
    
    let user: CommonUsersService
    let instruments: InstrumentsService
    let operations: CommonOperationsService
    let operationsStream: OperationsStreamService
    let marketData: MarketDataService
    let marketDataStream: MarketDataStreamService
    let orders: OrdersService
    let ordersStream: OrdersStreamService
    let stopOrders: StopOrdersService
    
    init(target: ApiTarget, token: String, appName: String) {
        self.target = target
        let configBuilder = ConfigurationBuilder(target, token: token, appName: appName)
        self.user = GrpcUsersService(configBuilder)
        self.instruments = GrpcInstrumentsService(configBuilder)
        self.operations = GrpcOperationsService(configBuilder)
        self.operationsStream = GrpcOperationsStreamService(configBuilder)
        self.marketData = GrpcMarketDataService(configBuilder)
        self.marketDataStream = GrpcMarketDataStreamService(configBuilder)
        self.orders = GrpcOrdersService(configBuilder)
        self.ordersStream = GrpcOrdersStreamService(configBuilder)
        self.stopOrders = GrpcStopOrdersService(configBuilder)
    }
}
