internal extension Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse {
    func transform() -> any StreamData {
        if case .subscriptions = self.payload {
            return OperationsStreamSubscriptionPayloadModel(response: self)
        } else if case .portfolio = self.payload {
            return PortfolioStreamPayloadModel(response: self)
        }
        return PingStreamPayloadModel(sendedAt: self.ping.time.date)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse {
    func transform() -> any StreamData {
        if case .subscriptions = self.payload {
            return OperationsStreamSubscriptionPayloadModel(response: self)
        } else if case .position = self.payload {
            return PositionsStreamPayloadModel(response: self)
        }
        return PingStreamPayloadModel(sendedAt: self.ping.time.date)
    }
}
