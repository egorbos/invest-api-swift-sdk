#if compiler(>=5.5) && canImport(_Concurrency)
import GRPC
import Foundation

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct PortfolioAsyncStreamData: AsyncSequence {
    public typealias Element = PortfolioStreamPayload
    public typealias AsyncIterator = AsyncStreamIterator<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse, PortfolioStreamPayload>
    
    private let stream: GRPCAsyncResponseStream<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse>
    
    init(_ stream: GRPCAsyncResponseStream<Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse>) {
        self.stream = stream
    }
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncStreamIterator(iterator: stream.makeAsyncIterator()) { PortfolioStreamPayload(response: $0!) }
    }
}
#endif
