#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public class AsyncStreamWrapper<Client, Stream> {
    private let closure: (Client) -> Stream
    
    internal init(closure: @escaping (Client) -> Stream) {
        self.closure = closure
    }

    internal func get(client: Client) -> Stream {
        return closure(client)
    }
}
#endif
