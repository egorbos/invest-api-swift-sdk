import GRPC
import NIOCore
import Foundation

/// Сервис работы с торговыми поручениями в реальном времени.
public protocol OrdersStreamService {
    /// Stream сделок пользователя
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func tradesStream(accounts: [String], handler: @escaping (TradesStreamData) -> Void) throws -> DataStream
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Stream сделок пользователя
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func tradesStream(accounts: [String], handler: @escaping (TradesStreamData) -> Void) async throws -> GRPCAsyncResponseStream<Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse>
#endif
    
//    - TradesStreamRequest
//    Запрос установки соединения.
//
//    Field    Type    Description
//    accounts    Массив объектов string    Идентификаторы счетов.
//
//    - TradesStreamResponse
//    Информация о торговых поручениях.
//
//    Field    Type    Description
//    order_trades    OrderTrades    Информация об исполнении торгового поручения.
//    ping    Ping    Проверка активности стрима.
//
//    - OrderTrades
//    Информация об исполнении торгового поручения.
//
//    Field    Type    Description
//    order_id    string    Идентификатор торгового поручения.
//    created_at    google.protobuf.Timestamp    Дата и время создания сообщения в часовом поясе UTC.
//    direction    OrderDirection    Направление сделки.
//    figi    string    Figi-идентификатор инструмента.
//    trades    Массив объектов OrderTrade    Массив сделок.
//    account_id    string    Идентификатор счёта.
//    instrument_uid    string    UID идентификатор инструмента.
}

public protocol DataStream {
    func close() -> Void
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func close() async -> Void
#endif
}

internal struct OrdersDataStream: DataStream {
    let call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse>
    
    init(_ call: ServerStreamingCall<Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamRequest, Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse>) {
        self.call = call
    }
    
    func close() -> Void {
        
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func close() async -> Void {
        
    }
#endif
}

internal struct GrpcOrdersStreamService: OrdersStreamService {
    let client: OrdersStreamServiceClient
    
    init(_ client: OrdersStreamServiceClient) {
        self.client = client
    }
    
    /// Stream сделок пользователя
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func tradesStream(accounts: [String], handler: @escaping (TradesStreamData) -> Void) throws -> DataStream {
        var req = Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamRequest()
        req.accounts = accounts
        
        let call = self.client.tradesStream(req) { response in
            handler(TradesStreamData())
        }
        return OrdersDataStream(call)
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Stream сделок пользователя
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func tradesStream(accounts: [String], handler: @escaping (TradesStreamData) -> Void) async throws -> GRPCAsyncResponseStream<Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamResponse> {
        var req = Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamRequest()
        req.accounts = accounts
        
        let call = self.client.tradesStream(req)
        return call
    }
#endif
}
