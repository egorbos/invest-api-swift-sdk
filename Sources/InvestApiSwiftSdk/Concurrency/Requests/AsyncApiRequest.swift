#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public class AsyncApiRequest<Client, Result> {
    private let closure: (Client) async throws -> Result
    
    init(closure: @escaping (Client) async throws -> Result) {
        self.closure = closure
    }

    internal func sendAsync(client: Client) async throws -> Result {
        return try await closure(client)
    }
}
#endif
