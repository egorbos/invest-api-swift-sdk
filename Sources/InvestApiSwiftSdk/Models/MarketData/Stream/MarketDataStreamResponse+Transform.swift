internal extension Tinkoff_Public_Invest_Api_Contract_V1_MarketDataResponse {
    func transform() -> any StreamData {
        switch self.payload {
        case .subscribeCandlesResponse:
            return CandlesSubscriptionPayloadModel(response: self)
        case .subscribeOrderBookResponse:
            return OrderBooksSubscriptionPayloadModel(response: self)
        case .subscribeTradesResponse:
            return TradesSubscriptionPayloadModel(response: self)
        case .subscribeInfoResponse:
            return InfoSubscriptionPayloadModel(response: self)
        case .subscribeLastPriceResponse:
            return LastPricesSubscriptionPayloadModel(response: self)
        case .candle:
            return CandlePayloadModel(response: self)
        case .orderbook:
            return OrderBookPayloadModel(response: self)
        case .trade:
            return TradePayloadModel(response: self)
        case .tradingStatus:
            return TradingStatusPayloadModel(response: self)
        case .lastPrice:
            return LastPricePayloadModel(response: self)
        default:
            return PingStreamPayloadModel(sendedAt: self.ping.time.date)
        }
    }
}
