import NIOCore

public class ApiRequest<Client, Result> {
    private let closure: (Client) throws -> EventLoopFuture<Result>
    
    init(closure: @escaping (Client) throws -> EventLoopFuture<Result>) {
        self.closure = closure
    }

    internal func send(client: Client) throws -> EventLoopFuture<Result> {
        return try closure(client)
    }
}
