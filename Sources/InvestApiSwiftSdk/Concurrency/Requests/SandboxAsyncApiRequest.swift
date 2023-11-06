#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public class SandboxAsyncApiRequest<Result>: AsyncApiRequest<SandboxApiClient, Result> {
    // MARK: Сервис для работы с песочницей.
    
    /// Экземпляр `SandboxAsyncApiRequest` для регистрации счёта в песочнице.
    public static var openSandboxAccount: SandboxAsyncApiRequest<String> {
        .init {
            try await $0.sandbox.openSandboxAccount()
        }
    }
    
    /// Экземпляр `SandboxAsyncApiRequest` для получения счетов в песочнице.
    public static var getSandboxAccounts: SandboxAsyncApiRequest<[Account]> {
        .init {
            try await $0.sandbox.getSandboxAccounts()
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для закрытия счёта в песочнице.
    ///
    ///  - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func closeSandboxAccount(accountId id: String) -> SandboxAsyncApiRequest<Void> {
        .init {
            try await $0.sandbox.closeSandboxAccount(accountId: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для выставления заявки в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - orderRequestId: Идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - type: Тип заявки.
    ///     - direction: Направление операции.
    ///     - price: Цена за 1 инструмент (игнорируется для рыночных поручений).
    ///     - quantity: Количество лотов.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func postSandboxOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) -> SandboxAsyncApiRequest<OrderInfo> {
        .init {
            try await $0.sandbox.postSandboxOrder(
                accountId: accountId, instrumentId: instrumentId, orderRequestId: orderRequestId,
                type: type, direction: direction, price: price, quantity: quantity
            )
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для изменения заявки выставленной в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Биржевой идентификатор заявки.
    ///     - orderRequestId: Новый идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - price: Цена за 1 инструмент.
    ///     - priceType: Тип цены.
    ///     - quantity: Количество лотов.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func replaceSandboxOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) -> SandboxAsyncApiRequest<OrderInfo> {
        .init {
            try await $0.sandbox.replaceSandboxOrder(
                accountId: accountId, orderId: orderId, orderRequestId: orderRequestId,
                price: price, priceType: priceType, quantity: quantity
            )
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка активных заявок по счёту песочницы.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getSandboxOrders(accountId: String) -> SandboxAsyncApiRequest<[OrderInfo]> {
        .init {
            try await $0.sandbox.getSandboxOrders(accountId: accountId)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для отмены заявки выставленной в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Идентификатор заявки.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func cancelSandboxOrder(accountId: String, orderId: String) -> SandboxAsyncApiRequest<Date> {
        .init {
            try await $0.sandbox.cancelSandboxOrder(accountId: accountId, orderId: orderId)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения статуса заявки в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Идентификатор заявки.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getSandboxOrderState(accountId: String, orderId: String) -> SandboxAsyncApiRequest<OrderInfo> {
        .init {
            try await $0.sandbox.getSandboxOrderState(accountId: accountId, orderId: orderId)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка позиций в песочнице.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getSandboxPositions(accountId: String) -> SandboxAsyncApiRequest<PositionsCollection> {
        .init {
            try await $0.sandbox.getSandboxPositions(accountId: accountId)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка операций по счёту песочницы.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - state: Статус запрашиваемых операций.
    ///     - figi: Figi идентификатор инструмента для фильтрации.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getSandboxOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) -> SandboxAsyncApiRequest<[Operation]> {
        .init {
            try await $0.sandbox.getSandboxOperations(accountId: accountId, from: from, to: to, state: state, figi: figi)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка операций по счёту песочницы с пагинацией.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - cursor: Идентификатор элемента, с которого формируется начало списка.
    ///     - limit: Лимит количества операций. По умолчанию устанавливается значение 100, максимальное значение 1000.
    ///     - types: Типы операций.
    ///     - state: Статус запрашиваемых операций.
    ///     - withCommissions: Включить комиссии.
    ///     - withTrades: Включить массив сделок.
    ///     - withOvernights: Вкличить overnight операции.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getSandboxOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) -> SandboxAsyncApiRequest<OperationsByCursor> {
        .init {
            try await $0.sandbox.getSandboxOperationsByCursor(
                accountId: accountId, instrumentId: instrumentId, from: from, to: to, cursor: cursor,
                limit: limit, types: types, state: state, withCommissions: withCommissions,
                withTrades: withTrades, withOvernights: withOvernights
            )
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения портфеля по счёту песочницы.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getSandboxPortfolio(accountId: String, currency: CurrencyType) -> SandboxAsyncApiRequest<Portfolio> {
        .init {
            try await $0.sandbox.getSandboxPortfolio(accountId: accountId, currency: currency)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для пополнения счёта в песочнице.
    ///
    ///  - Parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    ///      - amount: Сумма пополнения счёта в рублях.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func sandboxPayIn(accountId id: String, amount: MoneyValue) -> SandboxAsyncApiRequest<MoneyValue> {
        .init {
            try await $0.sandbox.sandboxPayIn(accountId: id, amount: amount)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения доступного остатка для вывода средств в песочнице.
    ///
    ///  - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getSandboxWithdrawLimits(accountId id: String) -> SandboxAsyncApiRequest<WithdrawLimits> {
        .init {
            try await $0.sandbox.getSandboxWithdrawLimits(accountId: id)
        }
    }
    
    // MARK: Сервис предоставления справочной информации о пользователе.
    
    /// Экземпляр `SandboxAsyncApiRequest` для получения счетов пользователя.
    public static var getAccounts: SandboxAsyncApiRequest<[Account]> {
        .init {
            try await $0.user.getAccounts()
        }
    }

    /// Экземпляр `SandboxAsyncApiRequest` для получения лимитов запросов пользователя.
    public static var getUserTariff: SandboxAsyncApiRequest<UserTariff> {
        .init {
            try await $0.user.getUserTariff()
        }
    }

    /// Экземпляр `SandboxAsyncApiRequest` для получения информации о статусе пользователя.
    public static var getInfo: SandboxAsyncApiRequest<UserInfo> {
        .init {
            try await $0.user.getInfo()
        }
    }
    
    // MARK: Сервис получения биржевой информации.
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения исторических свечей по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///      - interval: Интервал запрашиваемых свечей.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getCandles(figi: String, from: Date, to: Date, interval: CandleInterval) -> SandboxAsyncApiRequest<[HistoricalCandle]> {
        .init {
            try await $0.marketData.getCandles(figi: figi, from: from, to: to, interval: interval)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения последних цен по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getLastPrices(figis: [String]) -> SandboxAsyncApiRequest<[LastPrice]> {
        .init {
            try await $0.marketData.getLastPrices(figis: figis)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения стакана по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getOrderBook(figi: String, depth: Int32) -> SandboxAsyncApiRequest<OrderBookInfo> {
        .init {
            try await $0.marketData.getOrderBook(figi: figi, depth: depth)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения статуса торгов по инструментам.
    ///
    ///  - Parameter figi: Figi идентификатор инструмента.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getTradingStatus(figi: String) -> SandboxAsyncApiRequest<TradingStatusInfo> {
        .init {
            try await $0.marketData.getTradingStatus(figi: figi)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения обезличенных сделок за последний час.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getLastTrades(figi: String, from: Date, to: Date) -> SandboxAsyncApiRequest<[Trade]> {
        .init {
            try await $0.marketData.getLastTrades(figi: figi, from: from, to: to)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения цен закрытия торговой сессии по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getClosePrices(figis: [String]) -> SandboxAsyncApiRequest<[InstrumentClosePrice]> {
        .init {
            try await $0.marketData.getClosePrices(figis: figis)
        }
    }
    
    // MARK: Сервис получения справочной информации о ценных бумагах.
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения расписания работы торговых площадок.
    ///
    /// - Parameters:
    ///     - exchange: Наименование биржи или расчетного календаря.
    ///     - from: Начало периода по часовому поясу UTC.
    ///     - to: Окончание периода по часовому поясу UTC.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func tradingSchedules(exchange: String, from: Date, to: Date) -> SandboxAsyncApiRequest<[TradingSchedule]> {
        .init {
            try await $0.instruments.tradingSchedules(exchange: exchange, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения облигации по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    ///  - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func bondBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxAsyncApiRequest<Bond> {
        .init {
            try await $0.instruments.bondBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка облигаций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func bonds(instrumentStatus: InstrumentStatus) -> SandboxAsyncApiRequest<[Bond]> {
        .init {
            try await $0.instruments.bonds(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения графика выплат купонов по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getBondCoupons(figi: String, from: Date, to: Date) -> SandboxAsyncApiRequest<[Coupon]> {
        .init {
            try await $0.instruments.getBondCoupons(figi: figi, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения валюты по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func currencyBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxAsyncApiRequest<Currency> {
        .init {
            try await $0.instruments.currencyBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка валют.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func currencies(instrumentStatus: InstrumentStatus) -> SandboxAsyncApiRequest<[Currency]> {
        .init {
            try await $0.instruments.currencies(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения инвестиционного фонда по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func etfBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxAsyncApiRequest<Etf> {
        .init {
            try await $0.instruments.etfBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка инвестиционных фондов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func etfs(instrumentStatus: InstrumentStatus) -> SandboxAsyncApiRequest<[Etf]> {
        .init {
            try await $0.instruments.etfs(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения фьючерсного контракта по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func futureBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxAsyncApiRequest<Future> {
        .init {
            try await $0.instruments.futureBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка фьючерсных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func futures(instrumentStatus: InstrumentStatus) -> SandboxAsyncApiRequest<[Future]> {
        .init {
            try await $0.instruments.futures(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения опционного контракта по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func optionBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxAsyncApiRequest<Option> {
        .init {
            try await $0.instruments.optionBy(idType: idType, classCode: classCode, id: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка опционных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func options(instrumentStatus: InstrumentStatus) -> SandboxAsyncApiRequest<[Option]> {
        .init {
            try await $0.instruments.options(instrumentStatus: instrumentStatus)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка опционных контрактов.
    ///
    /// - Parameters:
    ///     - basicAssetUid: Идентификатор базового актива опциона (обязательный параметр).
    ///     - basicAssetPositionUid: Идентификатор позиции базового актива опционного контракта.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func optionsBy(basicAssetUid: String, basicAssetPositionUid: String) -> SandboxAsyncApiRequest<[Option]> {
        .init {
            try await $0.instruments.optionsBy(basicAssetUid: basicAssetUid, basicAssetPositionUid: basicAssetPositionUid)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения акции по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func shareBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxAsyncApiRequest<Share> {
        .init {
            try await $0.instruments.shareBy(idType: idType, classCode: classCode, id: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка акций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func shares(instrumentStatus: InstrumentStatus) -> SandboxAsyncApiRequest<[Share]> {
        .init {
            try await $0.instruments.shares(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения накопленного купонного дохода по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getAccruedInterests(figi: String, from: Date, to: Date) -> SandboxAsyncApiRequest<[AccruedInterest]> {
        .init {
            try await $0.instruments.getAccruedInterests(figi: figi, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения размера гарантийного обеспечения по фьючерсному контракту.
    ///
    /// - Parameter figi: Figi-идентификатор инструмента.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getFutureContractMargin(figi: String) -> SandboxAsyncApiRequest<FutureContractMargin> {
        .init {
            try await $0.instruments.getFutureContractMargin(figi: figi)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения основной информации об инструменте.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getInstrumentBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxAsyncApiRequest<Instrument> {
        .init {
            try await $0.instruments.getInstrumentBy(idType: idType, classCode: classCode, id: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения событий выплаты дивидендов по инструменту.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getDividends(figi: String, from: Date, to: Date) -> SandboxAsyncApiRequest<[Dividend]> {
        .init {
            try await $0.instruments.getDividends(figi: figi, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения актива по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор актива.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getAssetBy(uid: String) -> SandboxAsyncApiRequest<AssetFull> {
        .init {
            try await $0.instruments.getAssetBy(uid: uid)
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения списка активов (работает для всех инструментов, за исключением срочных - опционов и фьючерсов).
    ///
    /// - Parameter kind: Вид запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getAssets(kind: InstrumentKind) -> SandboxAsyncApiRequest<[Asset]> {
        .init {
            try await $0.instruments.getAssets(kind: kind)
        }
    }

    /// Экземпляр `SandboxAsyncApiRequest` для получения списка избранных инструментов.
    public static var getFavorites: SandboxAsyncApiRequest<[FavoriteInstrument]> {
        .init {
            try await $0.instruments.getFavorites()
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для редактирования списка избранных инструментов.
    ///
    /// - Parameters:
    ///     - figis: Список figi идентификаторов инструментов.
    ///     - action: Тип действия со списком.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func editFavorites(figis: [String], action: FavoriteActionType) -> SandboxAsyncApiRequest<[FavoriteInstrument]> {
        .init {
            try await $0.instruments.editFavorites(figis: figis, action: action)
        }
    }

    /// Экземпляр `SandboxAsyncApiRequest` для получения списка стран.
    public static var getCountries: SandboxAsyncApiRequest<[Country]> {
        .init {
            try await $0.instruments.getCountries()
        }
    }

    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения инструмента.
    ///
    /// - Parameters:
    ///     - query: Строка поиска.
    ///     - kind: Фильтр по виду инструмента.
    ///     - apiTradeAvailableFlag: Фильтр для отображения только торговых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func findInstrument(query: String, kind: InstrumentKind, apiTradeAvailableFlag: Bool) -> SandboxAsyncApiRequest<[InstrumentShort]> {
        .init {
            try await $0.instruments.findInstrument(query: query, kind: kind, apiTradeAvailableFlag: apiTradeAvailableFlag)
        }
    }
    
    /// Возвращает экземпляр `SandboxAsyncApiRequest` для получения бренда по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор бренда.
    ///
    /// - Returns: Экземпляр `SandboxAsyncApiRequest`.
    public static func getBrandBy(uid: String) -> SandboxAsyncApiRequest<Brand> {
        .init {
            try await $0.instruments.getBrandBy(uid: uid)
        }
    }

    /// Экземпляр `SandboxAsyncApiRequest` для получения списка брендов.
    public static var getBrands: SandboxAsyncApiRequest<[Brand]> {
        .init {
            try await $0.instruments.getBrands()
        }
    }
}
#endif
