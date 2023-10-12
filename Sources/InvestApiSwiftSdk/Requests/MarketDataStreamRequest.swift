/// Запрос на поток предоставления биржевой информации.
public final class MarketDataStreamRequest {
    private var candles: [Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesRequest]
    private var orderBook: [Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookRequest]
    private var trades: [Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesRequest]
    private var info: [Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoRequest]
    private var lastPrice: [Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceRequest]
    
    public init() {
        self.candles = []
        self.orderBook = []
        self.trades = []
        self.info = []
        self.lastPrice = []
    }
}

public extension MarketDataStreamRequest {
    // MARK: Candles request
    
    private func addCandlesRequest(_ request: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesRequest) -> Void {
        if let existingIndex = candles.firstIndex(where: { e in
            e.subscriptionAction == request.subscriptionAction && e.waitingClose == request.waitingClose
        }) {
            for instrument in request.instruments {
                if !candles[existingIndex].instruments.contains(where: { e in
                    e.instrumentID == instrument.instrumentID && e.interval == instrument.interval
                }) {
                    candles[existingIndex].instruments.append(instrument)
                }
            }
        } else {
            candles.append(request)
        }
    }
    
    /// Создаёт запрос подписки на свечи.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///     - interval: Интервал свечи.
    ///     - waitingClose: Флаг ожидания закрытия временного интервала для отправки свечи.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func candles(uid: String, action: SubscriptionAction, interval: SubscriptionInterval, waitingClose: Bool) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.candles.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesRequest(uids: [uid], action: action, interval: interval, waitingClose: waitingClose)
        )
        return request
    }
    
    /// Добавляет запрос подписки на свечи в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///     - interval: Интервал свечи.
    ///     - waitingClose: Флаг ожидания закрытия временного интервала для отправки свечи.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func candles(uid: String, action: SubscriptionAction, interval: SubscriptionInterval, waitingClose: Bool) -> MarketDataStreamRequest {
        addCandlesRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesRequest(uids: [uid], action: action, interval: interval, waitingClose: waitingClose)
        )
        return self
    }
    
    /// Создаёт запрос подписки на свечи.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///     - interval: Интервал свечи.
    ///     - waitingClose: Флаг ожидания закрытия временного интервала для отправки свечи.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func candles(uids: [String], action: SubscriptionAction, interval: SubscriptionInterval, waitingClose: Bool) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.candles.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesRequest(uids: uids, action: action, interval: interval, waitingClose: waitingClose)
        )
        return request
    }
    
    /// Добавляет запрос подписки на свечи в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///     - interval: Интервал свечи.
    ///     - waitingClose: Флаг ожидания закрытия временного интервала для отправки свечи.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func candles(uids: [String], action: SubscriptionAction, interval: SubscriptionInterval, waitingClose: Bool) -> MarketDataStreamRequest {
        addCandlesRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesRequest(uids: uids, action: action, interval: interval, waitingClose: waitingClose)
        )
        return self
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesRequest {
    init(
        uids: [String],
        action: SubscriptionAction,
        interval: SubscriptionInterval,
        waitingClose: Bool
    ) {
        self.instruments = uids.map {
            Tinkoff_Public_Invest_Api_Contract_V1_CandleInstrument(uid: $0, interval: interval)
        }
        self.subscriptionAction = Tinkoff_Public_Invest_Api_Contract_V1_SubscriptionAction(rawValue: action.rawValue) ?? .unspecified
        self.waitingClose = waitingClose
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CandleInstrument {
    init(uid: String, interval: SubscriptionInterval) {
        self.instrumentID = uid
        self.interval = Tinkoff_Public_Invest_Api_Contract_V1_SubscriptionInterval(rawValue: interval.rawValue) ?? .unspecified
    }
}

public extension MarketDataStreamRequest {
    // MARK: Order book request
    
    private func addOrderBookRequest(_ request: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookRequest) -> Void {
        if let existingIndex = orderBook.firstIndex(where: { e in
            e.subscriptionAction == request.subscriptionAction
        }) {
            for instrument in request.instruments {
                if !orderBook[existingIndex].instruments.contains(where: { e in
                    e.instrumentID == instrument.instrumentID && e.depth == instrument.depth
                }) {
                    orderBook[existingIndex].instruments.append(instrument)
                }
            }
        } else {
            orderBook.append(request)
        }
    }
    
    /// Создаёт запрос подписки на стакан.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///     - depth: Глубина стакана (1, 10, 20, 30, 40, 50).
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func orderBook(uid: String, action: SubscriptionAction, depth: Int32) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.orderBook.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookRequest(uids: [uid], action: action, depth: depth)
        )
        return request
    }
    
    /// Добавляет запрос подписки на стакан в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///     - depth: Глубина стакана (1, 10, 20, 30, 40, 50).
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func orderBook(uid: String, action: SubscriptionAction, depth: Int32) -> MarketDataStreamRequest {
        addOrderBookRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookRequest(uids: [uid], action: action, depth: depth)
        )
        return self
    }
    
    /// Создаёт запрос подписки на стаканы.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///     - depth: Глубина стакана (1, 10, 20, 30, 40, 50).
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func orderBook(uids: [String], action: SubscriptionAction, depth: Int32) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.orderBook.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookRequest(uids: uids, action: action, depth: depth)
        )
        return request
    }
    
    /// Добавляет запрос подписки на стаканы в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///     - depth: Глубина стакана (1, 10, 20, 30, 40, 50).
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func orderBook(uids: [String], action: SubscriptionAction, depth: Int32) -> MarketDataStreamRequest {
        addOrderBookRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookRequest(uids: uids, action: action, depth: depth)
        )
        return self
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookRequest {
    init(
        uids: [String],
        action: SubscriptionAction,
        depth: Int32
    ) {
        self.instruments = uids.map {
            Tinkoff_Public_Invest_Api_Contract_V1_OrderBookInstrument(uid: $0, depth: depth)
        }
        self.subscriptionAction = Tinkoff_Public_Invest_Api_Contract_V1_SubscriptionAction(rawValue: action.rawValue) ?? .unspecified
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OrderBookInstrument {
    init(uid: String, depth: Int32) {
        self.instrumentID = uid
        self.depth = depth
    }
}

public extension MarketDataStreamRequest {
    // MARK: Trades request
    
    private func addTradesRequest(_ request: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesRequest) -> Void {
        if let existingIndex = trades.firstIndex(where: { e in
            e.subscriptionAction == request.subscriptionAction
        }) {
            for instrument in request.instruments {
                if !trades[existingIndex].instruments.contains(where: { e in
                    e.instrumentID == instrument.instrumentID
                }) {
                    trades[existingIndex].instruments.append(instrument)
                }
            }
        } else {
            trades.append(request)
        }
    }
    
    /// Создаёт запрос подписки на ленту обезличенных сделок.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func trades(uid: String, action: SubscriptionAction) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.trades.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesRequest(uids: [uid], action: action)
        )
        return request
    }
    
    /// Добавляет запрос подписки на ленту обезличенных сделок в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func trades(uid: String, action: SubscriptionAction) -> MarketDataStreamRequest {
        addTradesRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesRequest(uids: [uid], action: action)
        )
        return self
    }
    
    /// Создаёт запрос подписки на ленту обезличенных сделок.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func trades(uids: [String], action: SubscriptionAction) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.trades.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesRequest(uids: uids, action: action)
        )
        return request
    }
    
    /// Добавляет запрос подписки на ленту обезличенных сделок в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func trades(uids: [String], action: SubscriptionAction) -> MarketDataStreamRequest {
        addTradesRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesRequest(uids: uids, action: action)
        )
        return self
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesRequest {
    init(uids: [String], action: SubscriptionAction) {
        self.instruments = uids.map {
            Tinkoff_Public_Invest_Api_Contract_V1_TradeInstrument(uid: $0)
        }
        self.subscriptionAction = Tinkoff_Public_Invest_Api_Contract_V1_SubscriptionAction(rawValue: action.rawValue) ?? .unspecified
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradeInstrument {
    init(uid: String) {
        self.instrumentID = uid
    }
}

public extension MarketDataStreamRequest {
    // MARK: Info request
    
    private func addInfoRequest(_ request: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoRequest) -> Void {
        if let existingIndex = info.firstIndex(where: { e in
            e.subscriptionAction == request.subscriptionAction
        }) {
            for instrument in request.instruments {
                if !info[existingIndex].instruments.contains(where: { e in
                    e.instrumentID == instrument.instrumentID
                }) {
                    info[existingIndex].instruments.append(instrument)
                }
            }
        } else {
            info.append(request)
        }
    }
    
    /// Создаёт запрос подписки на торговый статус инструмента.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func info(uid: String, action: SubscriptionAction) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.info.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoRequest(uids: [uid], action: action)
        )
        return request
    }
    
    /// Добавляет запрос подписки на торговый статус инструмента в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func info(uid: String, action: SubscriptionAction) -> MarketDataStreamRequest {
        addInfoRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoRequest(uids: [uid], action: action)
        )
        return self
    }
    
    /// Создаёт запрос подписки на торговые статусы инструментов.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func info(uids: [String], action: SubscriptionAction) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.info.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoRequest(uids: uids, action: action)
        )
        return request
    }
    
    /// Добавляет запрос подписки на торговые статусы инструментов в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func info(uids: [String], action: SubscriptionAction) -> MarketDataStreamRequest {
        addInfoRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoRequest(uids: uids, action: action)
        )
        return self
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoRequest {
    init(uids: [String], action: SubscriptionAction) {
        self.instruments = uids.map {
            Tinkoff_Public_Invest_Api_Contract_V1_InfoInstrument(uid: $0)
        }
        self.subscriptionAction = Tinkoff_Public_Invest_Api_Contract_V1_SubscriptionAction(rawValue: action.rawValue) ?? .unspecified
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InfoInstrument {
    init(uid: String) {
        self.instrumentID = uid
    }
}

public extension MarketDataStreamRequest {
    // MARK: Last price request
    
    private func addLastPriceRequest(_ request: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceRequest) -> Void {
        if let existingIndex = lastPrice.firstIndex(where: { e in
            e.subscriptionAction == request.subscriptionAction
        }) {
            for instrument in request.instruments {
                if !lastPrice[existingIndex].instruments.contains(where: { e in
                    e.instrumentID == instrument.instrumentID
                }) {
                    lastPrice[existingIndex].instruments.append(instrument)
                }
            }
        } else {
            lastPrice.append(request)
        }
    }
    
    /// Создаёт запрос подписки на цену последней сделки.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func lastPrice(uid: String, action: SubscriptionAction) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.lastPrice.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceRequest(uids: [uid], action: action)
        )
        return request
    }
    
    /// Добавляет запрос подписки на цену последней сделки в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uid: Uid идентификатор актива.
    ///     - action: Тип операции с подпиской.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func lastPrice(uid: String, action: SubscriptionAction) -> MarketDataStreamRequest {
        addLastPriceRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceRequest(uids: [uid], action: action)
        )
        return self
    }
    
    /// Создаёт запрос подписки на цену последней сделки.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    static func lastPrice(uids: [String], action: SubscriptionAction) -> MarketDataStreamRequest {
        let request = MarketDataStreamRequest()
        request.lastPrice.append(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceRequest(uids: uids, action: action)
        )
        return request
    }
    
    /// Добавляет запрос подписки на цены последних сделок в данный экземпляр запроса на поток предоставления биржевой информации.
    ///
    /// - Parameters
    ///     - uids: Uid идентификаторы активов.
    ///     - action: Тип операции с подписками.
    ///
    /// - Returns: Запрос на поток предоставления биржевой информации `MarketDataStreamRequest`.
    func lastPrice(uids: [String], action: SubscriptionAction) -> MarketDataStreamRequest {
        addLastPriceRequest(
            Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceRequest(uids: uids, action: action)
        )
        return self
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceRequest {
    init(uids: [String], action: SubscriptionAction) {
        self.instruments = uids.map {
            Tinkoff_Public_Invest_Api_Contract_V1_LastPriceInstrument(uid: $0)
        }
        self.subscriptionAction = Tinkoff_Public_Invest_Api_Contract_V1_SubscriptionAction(rawValue: action.rawValue) ?? .unspecified
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_LastPriceInstrument {
    init(uid: String) {
        self.instrumentID = uid
    }
}

internal extension MarketDataStreamRequest {
    func transformToRequestsForCall() -> [Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest] {
        var requests: [Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest] = []
        for candlesRequest in candles {
            requests.append(
                Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest(candlesRequest: candlesRequest)
            )
        }
        for orderBookRequest in orderBook {
            requests.append(
                Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest(orderBookRequest: orderBookRequest)
            )
        }
        for tradesRequest in trades {
            requests.append(
                Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest(tradesRequest: tradesRequest)
            )
        }
        for infoRequest in info {
            requests.append(
                Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest(infoRequest: infoRequest)
            )
        }
        for lastPriceRequest in lastPrice {
            requests.append(
                Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest(lastPriceRequest: lastPriceRequest)
            )
        }
        return requests
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_MarketDataRequest {
    init(candlesRequest: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeCandlesRequest) {
        self.subscribeCandlesRequest = candlesRequest
    }
    
    init(orderBookRequest: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeOrderBookRequest) {
        self.subscribeOrderBookRequest = orderBookRequest
    }
    
    init(tradesRequest: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeTradesRequest) {
        self.subscribeTradesRequest = tradesRequest
    }
    
    init(infoRequest: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeInfoRequest) {
        self.subscribeInfoRequest = infoRequest
    }
    
    init(lastPriceRequest: Tinkoff_Public_Invest_Api_Contract_V1_SubscribeLastPriceRequest) {
        self.subscribeLastPriceRequest = lastPriceRequest
    }
}
