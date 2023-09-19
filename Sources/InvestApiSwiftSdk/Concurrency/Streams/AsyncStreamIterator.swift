#if compiler(>=5.5) && canImport(_Concurrency)
import GRPC

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct AsyncStreamIterator<StreamResponse, ServiceResponce>: AsyncIteratorProtocol {
    public typealias Element = ServiceResponce
    
    private let mapper: (StreamResponse?) -> ServiceResponce
    private var iterator: GRPCAsyncResponseStream<StreamResponse>.Iterator
    
    init(
        iterator: GRPCAsyncResponseStream<StreamResponse>.Iterator,
        mapper: @escaping (StreamResponse?) -> ServiceResponce
    ) {
        self.iterator = iterator
        self.mapper = mapper
    }
    
    public mutating func next() async throws -> ServiceResponce? {
        mapper(try await iterator.next())
    }
}
#endif
