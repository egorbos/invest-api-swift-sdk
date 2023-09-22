import Foundation

public struct TradesStreamPayload: StreamData {
    public typealias StreamDataType = TradeStreamItem
    
    public let time: Date
    public let data: StreamDataType
    public let type: StreamPayloadType
    
    public init(response: Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse) {
        if case .orderTrades(let data)? = response.payload {
            self.type = .data
            self.data = data.toModel()
            self.time = data.createdAt.date
        } else {
            self.type = .ping
            self.time = Date()
            self.data = TradeStreamItem()
        }
    }
}
