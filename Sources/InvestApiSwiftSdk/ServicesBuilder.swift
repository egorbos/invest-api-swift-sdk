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
            defaultCallOptions: self.callOptions
        )
        return GrpcSandboxService(client)
    }
    
    func makeUsersService() -> CommonUsersService  {
        let client = UsersServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcUsersService(client)
    }
    
    func makeInstrumentsService() -> InstrumentsService  {
        let client = InstrumentsServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcInstrumentsService(client)
    }
    
    func makeOperationsService() -> OperationsService  {
        let client = OperationsServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcOperationsService(client)
    }
    
    func makeOperationsStreamService() -> OperationsStreamService  {
        let client = OperationsStreamServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcOperationsStreamService(client)
    }
    
    func makeMarketDataService() -> MarketDataService  {
        let client = MarketDataServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcMarketDataService(client)
    }
    
    func makeMarketDataStreamService() -> MarketDataStreamService  {
        let client = MarketDataStreamServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcMarketDataStreamService(client)
    }

    func makeOrdersService() -> OrdersService  {
        let client = OrdersServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcOrdersService(client)
    }
    
    func makeOrdersStreamService() -> OrdersStreamService  {
        let client = OrdersStreamServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcOrdersStreamService(client)
    }
    
    func makeStopOrdersService() -> StopOrdersService  {
        let client = StopOrdersServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcStopOrdersService(client)
    }
}
