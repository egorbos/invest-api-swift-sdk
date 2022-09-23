import GRPC
import NIOCore
import NIOHPACK
import Foundation

internal class ServicesBuilder {
    private let channel: GRPCChannel
    private let callOptions: CallOptions
    
    init(_ channel: GRPCChannel, token: String, appName: String) {
        self.channel = channel
        let headers = HPACKHeaders([("Authorization", "Bearer \(token)"), ("x-app-name", appName)])
        self.callOptions = CallOptions(customMetadata: headers)
    }
    
    func makeSandboxService() -> SandboxService {
        let client = SandboxServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: SandboxServiceInterceptorFactory()
        )
        return GrpcSandboxService(client)
    }
    
    func makeUsersService() -> CommonUsersService  {
        let client = UsersServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: UsersServiceInterceptorFactory()
        )
        return GrpcUsersService(client)
    }
    
    func makeInstrumentsService() -> InstrumentsService  {
        let client = DefaultInstrumentsServiceAsyncClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: InstrumentsServiceInterceptorFactory()
        )
        return GrpcInstrumentsService(client)
    }
    
    func makeOperationsService() -> CommonOperationsService  {
        let client = DefaultOperationsServiceAsyncClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: OperationsServiceInterceptorFactory()
        )
        return GrpcOperationsService(client)
    }
    
    func makeOperationsStreamService() -> OperationsStreamService  {
        let client = DefaultOperationsStreamServiceAsyncClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: OperationsStreamServiceInterceptorFactory()
        )
        return GrpcOperationsStreamService(client)
    }
    
    func makeMarketDataService() -> MarketDataService  {
        let client = DefaultMarketDataServiceAsyncClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: MarketDataServiceInterceptorFactory()
        )
        return GrpcMarketDataService(client)
    }
    
    func makeMarketDataStreamService() -> MarketDataStreamService  {
        let client = DefaultMarketDataStreamServiceAsyncClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: MarketDataStreamServiceInterceptorFactory()
        )
        return GrpcMarketDataStreamService(client)
    }

    func makeOrdersService() -> OrdersService  {
        let client = DefaultOrdersServiceAsyncClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: OrdersServiceInterceptorFactory()
        )
        return GrpcOrdersService(client)
    }
    
    func makeOrdersStreamService() -> OrdersStreamService  {
        let client = DefaultOrdersStreamServiceAsyncClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: OrdersStreamServiceInterceptorFactory()
        )
        return GrpcOrdersStreamService(client)
    }
    
    func makeStopOrdersService() -> StopOrdersService  {
        let client = DefaultStopOrdersServiceAsyncClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions,
            interceptors: StopOrdersServiceInterceptorFactory()
        )
        return GrpcStopOrdersService(client)
    }
}
