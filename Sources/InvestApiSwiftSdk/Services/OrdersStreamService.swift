import NIOCore
import Foundation

/// Сервис работы с торговыми поручениями в реальном времени.
public protocol OrdersStreamService {
    /// Stream сделок пользователя
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func TradesStream() throws -> Void
    
    - TradesStreamRequest
    Запрос установки соединения.

    Field    Type    Description
    accounts    Массив объектов string    Идентификаторы счетов.

    - TradesStreamResponse
    Информация о торговых поручениях.

    Field    Type    Description
    order_trades    OrderTrades    Информация об исполнении торгового поручения.
    ping    Ping    Проверка активности стрима.
    
    - OrderTrades
    Информация об исполнении торгового поручения.

    Field    Type    Description
    order_id    string    Идентификатор торгового поручения.
    created_at    google.protobuf.Timestamp    Дата и время создания сообщения в часовом поясе UTC.
    direction    OrderDirection    Направление сделки.
    figi    string    Figi-идентификатор инструмента.
    trades    Массив объектов OrderTrade    Массив сделок.
    account_id    string    Идентификатор счёта.
    instrument_uid    string    UID идентификатор инструмента.
}

internal struct GrpcOrdersStreamService: OrdersStreamService {
    let client: OrdersStreamServiceClient
    
    init(_ client: OrdersStreamServiceClient) {
        self.client = client
    }
}
