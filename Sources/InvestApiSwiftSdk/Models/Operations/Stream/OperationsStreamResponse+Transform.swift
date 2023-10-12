internal extension Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse {
    func transform() -> any StreamData {
        if case .subscriptions = self.payload {
            return OperationsStreamSubscriptionPayload(response: self)
        } else if case .portfolio = self.payload {
            return PortfolioStreamPayload(response: self)
        }
        return PingStreamPayload(sendedAt: self.ping.time.date)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamResponse {
    func transform() -> any StreamData {
        if case .subscriptions = self.payload {
            return OperationsStreamSubscriptionPayload(response: self)
        } else if case .position = self.payload {
            return PositionsStreamPayload(response: self)
        }
        return PingStreamPayload(sendedAt: self.ping.time.date)
    }
}
