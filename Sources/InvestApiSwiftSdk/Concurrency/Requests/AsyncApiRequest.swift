#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 12, iOS 15, watchOS 8, tvOS 15, *)
public class AsyncApiRequest<Client, Result> {
    private let closure: (Client) async throws -> Result
    
    init(
        closure: @escaping (Client) async throws -> Result
    ) {
        self.closure = closure
    }

    internal func sendAsync(client: Client) async throws -> Result {
        return try await closure(client)
    }
}
#endif
