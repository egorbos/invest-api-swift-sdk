import Foundation

public struct PositionsStreamPayload: StreamData {
    public typealias StreamDataType = PositionsStreamItem
    
    public let time: Date
    public let data: StreamDataType
    public let type: StreamPayloadType
    
    public init(response: Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse) {
        if case .position(let data)? = response.payload {
            self.type = .data
            self.data = data.toModel()
            self.time = data.date.date
        } else {
            self.type = .ping
            self.time = Date()
            self.data = PositionsStreamItem()
        }
    }
}
