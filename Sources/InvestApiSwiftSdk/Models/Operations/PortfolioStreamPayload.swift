import Foundation

public struct PortfolioStreamPayload: StreamData {
    public typealias StreamDataType = Portfolio
    
    public let time: Date
    public let data: StreamDataType
    public let type: StreamPayloadType
    
    public init(response: Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse) {
        self.time = Date()
        if case .portfolio(let data)? = response.payload {
            self.type = .data
            self.data = data.toModel()
        } else {
            self.type = .ping
            self.data = Portfolio()
        }
    }
}
