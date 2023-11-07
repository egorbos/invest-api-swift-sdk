public class StreamWrapper<Client, Stream> {
    typealias StreamHandler = (any StreamData) -> Void
    
    private let closure: (Client, @escaping StreamHandler) -> Stream
    
    internal init(closure: @escaping (Client, @escaping StreamHandler) -> Stream) {
        self.closure = closure
    }

    internal func get(client: Client, handler: @escaping StreamHandler) -> Stream {
        return closure(client, handler)
    }
}
