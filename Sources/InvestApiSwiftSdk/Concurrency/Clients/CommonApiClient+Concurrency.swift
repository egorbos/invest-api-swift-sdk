#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public extension CommonApiClient {
    func sendRequest<T>(_ request: CommonAsyncApiRequest<T>) async throws -> T {
        return try await request.sendAsync(client: self)
    }
}
#endif
