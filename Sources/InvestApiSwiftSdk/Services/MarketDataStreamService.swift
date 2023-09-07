import NIOCore
import Foundation

/// Сервис получения биржевой информации в реальном времени.
public protocol MarketDataStreamService {
    /// Bi-directional стрим предоставления биржевой информации.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func MarketDataStream() throws -> Void
    
    - MarketDataRequest
    Запрос подписки или отписки на определённые биржевые данные.

    Field    Type    Description
    subscribe_candles_request    SubscribeCandlesRequest    Запрос подписки на свечи.
    subscribe_order_book_request    SubscribeOrderBookRequest    Запрос подписки на стаканы.
    subscribe_trades_request    SubscribeTradesRequest    Запрос подписки на ленту обезличенных сделок.
    subscribe_info_request    SubscribeInfoRequest    Запрос подписки на торговые статусы инструментов.
    subscribe_last_price_request    SubscribeLastPriceRequest    Запрос подписки на цены последних сделок.
    get_my_subscriptions    GetMySubscriptions    Запрос своих подписок.
    
    - MarketDataResponse
    Пакет биржевой информации по подписке.

    Field    Type    Description
    subscribe_candles_response    SubscribeCandlesResponse    Результат подписки на свечи.
    subscribe_order_book_response    SubscribeOrderBookResponse    Результат подписки на стаканы.
    subscribe_trades_response    SubscribeTradesResponse    Результат подписки на поток обезличенных сделок.
    subscribe_info_response    SubscribeInfoResponse    Результат подписки на торговые статусы инструментов.
    candle    Candle    Свеча.
    trade    Trade    Сделки.
    orderbook    OrderBook    Стакан.
    trading_status    TradingStatus    Торговый статус.
    ping    Ping    Проверка активности стрима.
    subscribe_last_price_response    SubscribeLastPriceResponse    Результат подписки на цены последние сделок по инструментам.
    last_price    LastPrice    Цена последней сделки.
    
    
    
    /// Server-side стрим предоставления биржевой информации.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func MarketDataServerSideStream() throws -> Void
    
    - MarketDataServerSideStreamRequest
    Field    Type    Description
    subscribe_candles_request    SubscribeCandlesRequest    Запрос подписки на свечи.
    subscribe_order_book_request    SubscribeOrderBookRequest    Запрос подписки на стаканы.
    subscribe_trades_request    SubscribeTradesRequest    Запрос подписки на ленту обезличенных сделок.
    subscribe_info_request    SubscribeInfoRequest    Запрос подписки на торговые статусы инструментов.
    subscribe_last_price_request    SubscribeLastPriceRequest    Запрос подписки на цены последних сделок.
    
    - MarketDataResponse
    Пакет биржевой информации по подписке.

    Field    Type    Description
    subscribe_candles_response    SubscribeCandlesResponse    Результат подписки на свечи.
    subscribe_order_book_response    SubscribeOrderBookResponse    Результат подписки на стаканы.
    subscribe_trades_response    SubscribeTradesResponse    Результат подписки на поток обезличенных сделок.
    subscribe_info_response    SubscribeInfoResponse    Результат подписки на торговые статусы инструментов.
    candle    Candle    Свеча.
    trade    Trade    Сделки.
    orderbook    OrderBook    Стакан.
    trading_status    TradingStatus    Торговый статус.
    ping    Ping    Проверка активности стрима.
    subscribe_last_price_response    SubscribeLastPriceResponse    Результат подписки на цены последние сделок по инструментам.
    last_price    LastPrice    Цена последней сделки.
}

internal struct GrpcMarketDataStreamService: MarketDataStreamService {
    let client: MarketDataStreamServiceClient
    
    init(_ client: MarketDataStreamServiceClient) {
        self.client = client
    }
}
