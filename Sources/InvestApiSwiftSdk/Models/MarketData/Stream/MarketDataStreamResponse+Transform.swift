internal extension Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse {
    func transform() -> any StreamData {
        switch self.payload {
        case .subscribeCandlesResponse:
            return CandlesSubscriptionPayload(response: self)
        case .subscribeOrderBookResponse:
            return OrderBooksSubscriptionPayload(response: self)
        case .subscribeTradesResponse:
            return TradesSubscriptionPayload(response: self)
        case .subscribeInfoResponse:
            return InfoSubscriptionPayload(response: self)
        case .subscribeLastPriceResponse:
            return LastPricesSubscriptionPayload(response: self)
        case .candle:
            return CandlePayload(response: self)
        case .orderbook:
            return OrderBookPayload(response: self)
        case .trade:
            return TradePayload(response: self)
        case .tradingStatus:
            return TradingStatusPayload(response: self)
        case .lastPrice:
            return LastPricePayload(response: self)
        default:
            return PingStreamPayload(sendedAt: self.ping.time.date)
        }
    }
}
