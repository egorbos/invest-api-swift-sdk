#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public extension SandboxApiClient {
    func sendRequest<T>(_ request: SandboxAsyncApiRequest<T>) async throws -> T {
        return try await request.sendAsync(client: self)
    }
}
#endif
