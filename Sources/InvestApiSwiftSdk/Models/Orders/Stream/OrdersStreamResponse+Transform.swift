internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse {
    func transform() -> any StreamData {
        if case .orderTrades = self.payload {
            return TradesStreamPayloadModel(response: self)
        }
        return PingStreamPayloadModel(sendedAt: self.ping.time.date)
    }
}
