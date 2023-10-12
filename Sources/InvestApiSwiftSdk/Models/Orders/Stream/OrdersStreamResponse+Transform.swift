internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse {
    func transform() -> any StreamData {
        if case .orderTrades = self.payload {
            return TradesStreamPayload(response: self)
        }
        return PingStreamPayload(sendedAt: self.ping.time.date)
    }
}
