import NIOCore
import Foundation

/// Сервис получения биржевой информации.
public protocol MarketDataService {
    /// Получает исторические свечи по инструменту.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///      - interval: Интервал запрашиваемых свечей.
    ///
    ///  - returns: Массив исторических свечей `[HistoricalCandle]`.
    func getCandles(
        figi: String,
        from: Date,
        to: Date,
        interval: CandleInterval
    ) throws -> EventLoopFuture<[HistoricalCandle]>
    
    /// Получает последние цены по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификаторы инструментов.
    ///
    ///  - returns: Массив последних цен `[LastPrice]`.
    func getLastPrices(figi: [String]) throws -> EventLoopFuture<[LastPrice]>
    
    /// Получает стакан по инструменту.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    ///
    ///  - returns: Информация о стакане `OrderBookInfo`.
    func getOrderBook(figi: String, depth: Int32) throws -> EventLoopFuture<OrderBookInfo>
    
    /// Получает статус торгов по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///
    ///  - returns: Информация о торговом статусе `TradingStatusInfo`.
    func getTradingStatus(figi: String) throws -> EventLoopFuture<TradingStatusInfo>
    
    /// Получает обезличенные сделки за последний час.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    ///  - returns: Массив обезличенных сделок за последний час `[Trade]`.
    func getLastTrades(
        figi: String,
        from: Date,
        to: Date
    ) throws -> EventLoopFuture<[Trade]>
    
    /// Получает цены закрытия торговой сессии по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификаторы инструментов.
    ///
    ///  - returns: Массив цен закрытия торговой сессии `[InstrumentClosePrice]`.
    func getClosePrices(figi: [String]) throws -> EventLoopFuture<[InstrumentClosePrice]>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Получает исторические свечи по инструменту.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///      - interval: Интервал запрашиваемых свечей.
    ///
    ///  - returns: Массив исторических свечей `[HistoricalCandle]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getCandles(
        figi: String,
        from: Date,
        to: Date,
        interval: CandleInterval
    ) async throws -> [HistoricalCandle]
    
    /// Получает последние цены по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификаторы инструментов.
    ///
    ///  - returns: Массив последних цен `[LastPrice]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getLastPrices(figi: [String]) async throws -> [LastPrice]
    
    /// Получает стакан по инструменту.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    ///
    ///  - returns: Информация о стакане `OrderBookInfo`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getOrderBook(figi: String, depth: Int32) async throws -> OrderBookInfo
    
    /// Получает статус торгов по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///
    ///  - returns: Информация о торговом статусе `TradingStatusInfo`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getTradingStatus(figi: String) async throws -> TradingStatusInfo
    
    /// Получает обезличенные сделки за последний час.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    ///  - returns: Массив обезличенных сделок за последний час `[Trade]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getLastTrades(figi: String, from: Date, to: Date) async throws -> [Trade]
    
    /// Получает цены закрытия торговой сессии по инструментам.
    ///
    ///  - parameters:
    ///      - figi: Figi идентификаторы инструментов.
    ///
    ///  - returns: Массив цен закрытия торговой сессии `[InstrumentClosePrice]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getClosePrices(figi: [String]) async throws -> [InstrumentClosePrice]
#endif
}

internal struct GrpcMarketDataService: MarketDataService {
    let client: MarketDataServiceClient
    
    init(_ client: MarketDataServiceClient) {
        self.client = client
    }
    
    func getCandles(
        figi: String,
        from: Date,
        to: Date,
        interval: CandleInterval
    ) throws -> EventLoopFuture<[HistoricalCandle]> {
        self.client
            .getCandles(
                try Requests
                    .MarketDataServiceRequests
                    .getCandlesRequest
                    .with(figi: figi, from: from, to: to, interval: interval)
            )
            .response
            .map { $0.candles.map { $0.toModel() } }
    }
    
    func getLastPrices(figi: [String]) throws -> EventLoopFuture<[LastPrice]> {
        self.client
            .getLastPrices(Requests.MarketDataServiceRequests.getLastPricesRequest.with(figi: figi))
            .response
            .map { $0.lastPrices.map { $0.toModel() } }
    }
    
    func getOrderBook(figi: String, depth: Int32) throws -> EventLoopFuture<OrderBookInfo> {
        self.client
            .getOrderBook(
                Requests.MarketDataServiceRequests.getOrderBookRequest.with(figi: figi, depth: depth)
            )
            .response
            .map { $0.toModel() }
    }
    
    func getTradingStatus(figi: String) throws -> EventLoopFuture<TradingStatusInfo> {
        self.client
            .getTradingStatus(Requests.MarketDataServiceRequests.getTradingStatusRequest.with(figi: figi))
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
    func getLastTrades(
        figi: String,
        from: Date,
        to: Date
    ) throws -> EventLoopFuture<[Trade]> {
        self.client
            .getLastTrades(
                try Requests.MarketDataServiceRequests.getLastTradesRequest.with(figi: figi, from: from, to: to)
            )
            .response
            .flatMapThrowing { try $0.trades.map { try $0.toModel() } }
    }
    
    func getClosePrices(figi: [String]) throws -> EventLoopFuture<[InstrumentClosePrice]> {
        self.client
            .getClosePrices(Requests.MarketDataServiceRequests.getClosePricesRequest.with(figi: figi))
            .response
            .map { $0.closePrices.map{ $0.toModel() } }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func getCandles(
        figi: String,
        from: Date,
        to: Date,
        interval: CandleInterval
    ) async throws -> [HistoricalCandle] {
        try await self.client
            .getCandles(
                try Requests
                    .MarketDataServiceRequests
                    .getCandlesRequest
                    .with(figi: figi, from: from, to: to, interval: interval)
            )
            .candles
            .map { $0.toModel() }
    }
    
    func getLastPrices(figi: [String]) async throws -> [LastPrice] {
        try await self.client
            .getLastPrices(Requests.MarketDataServiceRequests.getLastPricesRequest.with(figi: figi))
            .lastPrices
            .map { $0.toModel() }
    }
    
    func getOrderBook(figi: String, depth: Int32) async throws -> OrderBookInfo {
        try await self.client
            .getOrderBook(
                Requests.MarketDataServiceRequests.getOrderBookRequest.with(figi: figi, depth: depth)
            )
            .toModel()
    }
    
    func getTradingStatus(figi: String) async throws -> TradingStatusInfo {
        try await self.client
            .getTradingStatus(Requests.MarketDataServiceRequests.getTradingStatusRequest.with(figi: figi))
            .toModel()
    }
    
    func getLastTrades(figi: String, from: Date, to: Date) async throws -> [Trade] {
        try await self.client
            .getLastTrades(
                Requests.MarketDataServiceRequests.getLastTradesRequest.with(figi: figi, from: from, to: to)
            )
            .trades
            .map { try $0.toModel() }
    }
    
    func getClosePrices(figi: [String]) async throws -> [InstrumentClosePrice] {
        try await self.client
            .getClosePrices(Requests.MarketDataServiceRequests.getClosePricesRequest.with(figi: figi))
            .closePrices
            .map{ $0.toModel() }
    }
#endif
}
