#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public extension SandboxApiClient {
    func sendRequest<Result>(_ request: SandboxAsyncApiRequest<Result>) async throws -> Result {
        return try await request.sendAsync(client: self)
    }
    
    func stream<Stream>(_ stream: SandboxAsyncStreamWrapper<Stream>) -> Stream {
        return stream.get(client: self)
    }
}
#endif
