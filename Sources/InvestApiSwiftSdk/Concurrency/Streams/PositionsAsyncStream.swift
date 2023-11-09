#if compiler(>=5.5) && canImport(_Concurrency)
import GRPC

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct PositionsAsyncStream: AsyncSequence {
    public typealias Element = any StreamData
    public typealias AsyncIterator = AsyncStreamIterator
        <Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse, any StreamData>
    
    private let stream: GRPCAsyncResponseStream<Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse>
    
    init(_ stream: GRPCAsyncResponseStream<Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse>) {
        self.stream = stream
    }
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncStreamIterator(iterator: stream.makeAsyncIterator()) { $0!.transform() }
    }
}
#endif
