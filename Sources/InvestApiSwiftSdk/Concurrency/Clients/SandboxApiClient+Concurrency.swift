#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 12, iOS 15, watchOS 8, tvOS 15, *)
public extension SandboxApiClient {
    /// Отправляет запрос к Tinkoff API.
    ///
    /// ```
    /// let result = try await client.sendRequest(.getInfo) // Аналогично try await client.user.getInfo()
    /// ```
    ///
    ///  - parameters:
    ///      - request: Запрос.
    ///
    ///  - returns: Результат запроса к Tinkoff API, являющегося экземпляром типа `T`.
    func sendRequest<T>(_ req: SandboxAsyncApiRequest<T>) async throws -> T {
        return try await req.sendAsync(client: self)
    }
}
#endif
