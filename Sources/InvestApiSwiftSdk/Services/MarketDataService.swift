import NIOCore
import Foundation

/// Сервис получения биржевой информации.
public protocol MarketDataService {
    /// Получает исторические свечи по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///      - interval: Интервал запрашиваемых свечей.
    ///
    ///  - Returns: Массив исторических свечей `[HistoricalCandle]`.
    func getCandles(figi: String, from: Date, to: Date, interval: CandleInterval) throws -> EventLoopFuture<[HistoricalCandle]>
    
    /// Получает последние цены по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Массив последних цен `[LastPrice]`.
    func getLastPrices(figis: [String]) throws -> EventLoopFuture<[LastPrice]>
    
    /// Получает стакан по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    ///
    ///  - Returns: Информация о стакане `OrderBookInfo`.
    func getOrderBook(figi: String, depth: Int32) throws -> EventLoopFuture<OrderBookInfo>
    
    /// Получает статус торгов по инструментам.
    ///
    ///  - Parameter figi: Figi идентификатор инструмента.
    ///
    ///  - Returns: Информация о торговом статусе `TradingStatusInfo`.
    func getTradingStatus(figi: String) throws -> EventLoopFuture<TradingStatusInfo>
    
    /// Получает обезличенные сделки за последний час.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    ///  - Returns: Массив обезличенных сделок за последний час `[Trade]`.
    func getLastTrades(figi: String, from: Date, to: Date) -> EventLoopFuture<[Trade]>
    
    /// Получает цены закрытия торговой сессии по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Массив цен закрытия торговой сессии `[InstrumentClosePrice]`.
    func getClosePrices(figis: [String]) throws -> EventLoopFuture<[InstrumentClosePrice]>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Получает исторические свечи по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///      - interval: Интервал запрашиваемых свечей.
    ///
    ///  - Returns: Массив исторических свечей `[HistoricalCandle]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getCandles(figi: String, from: Date, to: Date, interval: CandleInterval) async throws -> [HistoricalCandle]
    
    /// Получает последние цены по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Массив последних цен `[LastPrice]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getLastPrices(figis: [String]) async throws -> [LastPrice]
    
    /// Получает стакан по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    ///
    ///  - Returns: Информация о стакане `OrderBookInfo`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getOrderBook(figi: String, depth: Int32) async throws -> OrderBookInfo
    
    /// Получает статус торгов по инструментам.
    ///
    ///  - Parameter figi: Figi идентификатор инструмента.
    ///
    ///  - Returns: Информация о торговом статусе `TradingStatusInfo`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getTradingStatus(figi: String) async throws -> TradingStatusInfo
    
    /// Получает обезличенные сделки за последний час.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    ///  - Returns: Массив обезличенных сделок за последний час `[Trade]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getLastTrades(figi: String, from: Date, to: Date) async throws -> [Trade]
    
    /// Получает цены закрытия торговой сессии по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Массив цен закрытия торговой сессии `[InstrumentClosePrice]`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getClosePrices(figis: [String]) async throws -> [InstrumentClosePrice]
#endif
}

internal struct GrpcMarketDataService: MarketDataService {
    let client: MarketDataServiceClient
    
    init(_ client: MarketDataServiceClient) {
        self.client = client
    }
    
    func getCandles(figi: String, from: Date, to: Date, interval: CandleInterval) throws -> EventLoopFuture<[HistoricalCandle]> {
        self.client
            .getCandles(try .new(figi: figi, from: from, to: to, interval: interval))
            .response
            .map {
                $0.candles.map { $0.toModel() }
            }
    }
    
    func getLastPrices(figis: [String]) throws -> EventLoopFuture<[LastPrice]> {
        self.client
            .getLastPrices(.new(figis: figis))
            .response
            .map {
                $0.lastPrices.map { $0.toModel() }
            }
    }
    
    func getOrderBook(figi: String, depth: Int32) throws -> EventLoopFuture<OrderBookInfo> {
        self.client
            .getOrderBook(.new(figi: figi, depth: depth))
            .response
            .map { $0.toModel() }
    }
    
    func getTradingStatus(figi: String) throws -> EventLoopFuture<TradingStatusInfo> {
        self.client
            .getTradingStatus(.new(figi: figi))
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
    func getLastTrades(figi: String, from: Date, to: Date) -> EventLoopFuture<[Trade]> {
        self.client
            .getLastTrades(.new(figi: figi, from: from, to: to))
            .response
            .map {
                $0.trades.map { $0.toModel() }
            }
    }
    
    func getClosePrices(figis: [String]) throws -> EventLoopFuture<[InstrumentClosePrice]> {
        self.client
            .getClosePrices(.new(figis: figis))
            .response
            .map {
                $0.closePrices.map{ $0.toModel() }
            }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func getCandles(figi: String, from: Date, to: Date, interval: CandleInterval) async throws -> [HistoricalCandle] {
        try await self.client
            .getCandles(try .new(figi: figi, from: from, to: to, interval: interval))
            .candles
            .map { $0.toModel() }
    }
    
    func getLastPrices(figis: [String]) async throws -> [LastPrice] {
        try await self.client
            .getLastPrices(.new(figis: figis))
            .lastPrices
            .map { $0.toModel() }
    }
    
    func getOrderBook(figi: String, depth: Int32) async throws -> OrderBookInfo {
        try await self.client
            .getOrderBook(.new(figi: figi, depth: depth))
            .toModel()
    }
    
    func getTradingStatus(figi: String) async throws -> TradingStatusInfo {
        try await self.client
            .getTradingStatus(.new(figi: figi))
            .toModel()
    }
    
    func getLastTrades(figi: String, from: Date, to: Date) async throws -> [Trade] {
        try await self.client
            .getLastTrades(.new(figi: figi, from: from, to: to))
            .trades
            .map { $0.toModel() }
    }
    
    func getClosePrices(figis: [String]) async throws -> [InstrumentClosePrice] {
        try await self.client
            .getClosePrices(.new(figis: figis))
            .closePrices
            .map{ $0.toModel() }
    }
#endif
}
