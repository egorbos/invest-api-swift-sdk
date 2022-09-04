import Foundation

protocol SandboxUsersService {
    
}

protocol CommonUsersService: SandboxUsersService {
    
}

final internal class GrpcUsersService: GrpcService, CommonUsersService {
    private lazy var client = UsersServiceAsyncClient(
        channel: self.channel,
        defaultCallOptions: self.callOptions
    )
}
