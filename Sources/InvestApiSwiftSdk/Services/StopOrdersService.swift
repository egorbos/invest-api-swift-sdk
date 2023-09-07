import NIOCore
import Foundation

/// Сервис работы со стоп-ордерами.
public protocol StopOrdersService {
    /// Выставляет стоп-заявку.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func PostStopOrder() throws -> Void
    
    - PostStopOrderRequest
    Запрос выставления стоп-заявки.

    Field    Type    Description
    figi    string    Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.
    quantity    int64    Количество лотов.
    price    Quotation    Цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.
    stop_price    Quotation    Стоп-цена заявки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.
    direction    StopOrderDirection    Направление операции.
    account_id    string    Номер счёта.
    expiration_type    StopOrderExpirationType    Тип экспирации заявки.
    stop_order_type    StopOrderType    Тип заявки.
    expire_date    google.protobuf.Timestamp    Дата и время окончания действия стоп-заявки в часовом поясе UTC. Для ExpirationType = GoodTillDate заполнение обязательно.
    instrument_id    string    Идентификатор инструмента, принимает значения Figi или instrument_uid.
    
    - PostStopOrderResponse
    Результат выставления стоп-заявки.

    Field    Type    Description
    stop_order_id    string    Уникальный идентификатор стоп-заявки.
    
    
    
    /// Получает список активных стоп заявок по счёту.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetStopOrders() throws -> Void
    
    - GetStopOrdersRequest
    Запрос получения списка активных стоп-заявок.

    Field    Type    Description
    account_id    string    Идентификатор счёта клиента.

    - GetStopOrdersResponse
    Список активных стоп-заявок.

    Field    Type    Description
    stop_orders    Массив объектов StopOrder    Массив стоп-заявок по счёту.
    
    - StopOrder
    Информация о стоп-заявке.

    Field    Type    Description
    stop_order_id    string    Идентификатор-идентификатор стоп-заявки.
    lots_requested    int64    Запрошено лотов.
    figi    string    Figi-идентификатор инструмента.
    direction    StopOrderDirection    Направление операции.
    currency    string    Валюта стоп-заявки.
    order_type    StopOrderType    Тип стоп-заявки.
    create_date    google.protobuf.Timestamp    Дата и время выставления заявки в часовом поясе UTC.
    activation_date_time    google.protobuf.Timestamp    Дата и время конвертации стоп-заявки в биржевую в часовом поясе UTC.
    expiration_time    google.protobuf.Timestamp    Дата и время снятия заявки в часовом поясе UTC.
    price    MoneyValue    Цена заявки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.
    stop_price    MoneyValue    Цена активации стоп-заявки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.
    instrument_uid    string    instrument_uid идентификатор инструмента.
    
    
    
    /// Отменяет стоп-заявку.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func CancelStopOrder() throws -> Void
    
    - CancelStopOrderRequest
    Запрос отмены выставленной стоп-заявки.

    Field    Type    Description
    account_id    string    Идентификатор счёта клиента.
    stop_order_id    string    Уникальный идентификатор стоп-заявки.

    - CancelStopOrderResponse
    Результат отмены выставленной стоп-заявки.

    Field    Type    Description
    time    google.protobuf.Timestamp    Время отмены заявки в часовом поясе UTC.
}

internal struct GrpcStopOrdersService: StopOrdersService {
    let client: StopOrdersServiceClient
    
    init(_ client: StopOrdersServiceClient) {
        self.client = client
    }
}
