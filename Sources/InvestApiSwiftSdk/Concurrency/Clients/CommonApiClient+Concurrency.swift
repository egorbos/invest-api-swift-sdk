#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public extension CommonApiClient {
    func sendRequest<Result>(_ request: CommonAsyncApiRequest<Result>) async throws -> Result {
        return try await request.sendAsync(client: self)
    }
    
    func stream<Stream>(_ stream: CommonAsyncStreamWrapper<Stream>) -> Stream {
        return stream.get(client: self)
    }
}
#endif
