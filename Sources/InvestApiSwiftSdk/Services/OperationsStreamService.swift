import NIOCore
import Foundation

/// Сервис получения информации о портфеле в реальном времени
public protocol OperationsStreamService {
    /// Server-side stream обновлений портфеля
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func PortfolioStream() throws -> Void
    
    - PortfolioStreamRequest
    Запрос установки stream-соединения.

    Field    Type    Description
    accounts    Массив объектов string    Массив идентификаторов счётов пользователя

    - Информация по позициям и доходностям портфелей.
    
    Field    Type    Description
    subscriptions    PortfolioSubscriptionResult    Объект результата подписки.
    portfolio    PortfolioResponse    Объект стриминга портфеля.
    ping    Ping    Проверка активности стрима.
    
    
    
    /// Server-side stream обновлений информации по изменению позиций портфеля
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func PositionsStream() throws -> Void
    
    - PositionsStreamRequest
    Запрос установки stream-соединения позиций.

    Field    Type    Description
    accounts    Массив объектов string    Массив идентификаторов счётов пользователя
    
    - PositionsStreamResponse
    Информация по изменению позиций портфеля.

    Field    Type    Description
    subscriptions    PositionsSubscriptionResult    Объект результата подписки.
    position    PositionData    Объект стриминга позиций.
    ping    Ping    Проверка активности стрима.
}

internal struct GrpcOperationsStreamService: OperationsStreamService {
    let client: OperationsStreamServiceClient
    
    init(_ client: OperationsStreamServiceClient) {
        self.client = client
    }
}
